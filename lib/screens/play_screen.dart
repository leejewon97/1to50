import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:one_to_fifty/services/play_service.dart';
import 'package:one_to_fifty/widgets/countdown_widget.dart';
import 'package:one_to_fifty/widgets/end_dialog_widget.dart';
import 'package:one_to_fifty/widgets/number_buttons_builder_widget.dart';
import 'package:one_to_fifty/widgets/when_paused_dialog_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayScreen extends StatefulWidget {
  final ButtonStyle buttonStyle;
  final SharedPreferences prefs;

  const PlayScreen({
    super.key,
    required this.buttonStyle,
    required this.prefs,
  });

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final List<int> firstNumbers = PlayService().getRandomNumbers(1);
  final List<int> secondNumbers = PlayService().getRandomNumbers(2);
  late List<int> numbers;
  int currentNumber = 1;

  final List<bool> isVisibles = List.filled(25, true);

  late Ticker ticker;
  Duration playTime = Duration.zero;
  Duration pausedTime = Duration.zero;
  Duration countdown = const Duration(seconds: 4);

  List<String> recordTimes = [];

  @override
  void initState() {
    super.initState();
    numbers = List.from(firstNumbers);
    ticker = Ticker((elapsed) {
      setState(() {
        playTime = elapsed + pausedTime;
      });
    })
      ..start();
    recordTimes = widget.prefs.getStringList('recordTimes') ?? [];
  }

  @override
  void dispose() {
    ticker.dispose();
    super.dispose();
  }

  String timeFormatter(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final centiseconds =
        twoDigits(duration.inMilliseconds.remainder(1000) ~/ 10);
    return "$minutes:$seconds:$centiseconds";
  }

  void onNumberPressed(int index) {
    if (numbers[index] == currentNumber) {
      setState(() {
        if (currentNumber > 25) {
          isVisibles[index] = false;
        }
        if (currentNumber == 50) {
          ticker.stop();
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return EndDialog(
                playTime: timeFormatter(playTime),
                recordTimes: recordTimes,
                prefs: widget.prefs,
                buttonStyle: widget.buttonStyle,
              );
            },
          );
        } else {
          numbers[index] = secondNumbers[index];
          currentNumber++;
        }
      });
    }
  }

  void whenPaused() {
    if (ticker.isTicking) {
      setState(() {
        pausedTime = playTime;
        ticker.stop();
      });
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WhenPausedDialog(
            prefs: widget.prefs,
            buttonStyle: widget.buttonStyle,
            ticker: ticker,
          );
        },
      );
    } else {
      ticker.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
            backgroundColor: Colors.amber[100],
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      '$currentNumber',
                      style: const TextStyle(fontSize: 60),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: ticker.isTicking
                        ? NumberButtonsBuilder(
                            numbers: numbers,
                            isVisibles: isVisibles,
                            buttonStyle: widget.buttonStyle,
                            onNumberPressed: onNumberPressed,
                          )
                        : LayoutBuilder(builder: (context, constraints) {
                            return SizedBox(
                              height: constraints.maxWidth,
                            );
                          }),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      timeFormatter(playTime),
                      style: const TextStyle(fontSize: 60),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ticker.isTicking
                        ? IconButton(
                            onPressed: whenPaused,
                            icon: const Icon(
                              Icons.pause_rounded,
                              size: 80,
                            ),
                            style: widget.buttonStyle,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: countdown.inSeconds > 0,
            child: Conutdown(countdown: countdown),
          ),
        ],
      ),
    );
  }
}

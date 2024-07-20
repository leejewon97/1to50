import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter/scheduler.dart';
import 'package:one_to_fifty/services/play_service.dart';
import 'package:one_to_fifty/widgets/buttons/pause_button_widget.dart';
import 'package:one_to_fifty/widgets/countdown_widget.dart';
import 'package:one_to_fifty/widgets/end_dialog_widget.dart';
import 'package:one_to_fifty/widgets/number_buttons_builder_widget.dart';
import 'package:one_to_fifty/widgets/when_paused_dialog_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soundpool/soundpool.dart';

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

  Soundpool soundpool = Soundpool.fromOptions();
  late Future<Map<String, int>> soundIds;

  @override
  void initState() {
    super.initState();
    numbers = List.from(firstNumbers);
    ticker = Ticker((elapsed) {
      if (countdown.inSeconds > 0) {
        setState(() {
          countdown = const Duration(seconds: 4) - elapsed;
        });
      } else {
        tickerUpdateToStart();
      }
    });

    soundIds = PlayService().getSoundIds(soundpool);
    soundIds.then((ids) {
      soundpool.play(ids['countdown']!);
      ticker.start();
    });

    recordTimes = widget.prefs.getStringList('recordTimes') ?? [];
  }

  void tickerUpdateToStart() {
    ticker.stop();
    ticker = Ticker((elapsed) {
      setState(() {
        playTime = pausedTime + elapsed;
      });
    })
      ..start();
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

  void onNumberTapDown(int index) {
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
      soundIds.then((ids) {
        soundpool.play(ids['tap']!);
      });
    } else {
      soundIds.then((ids) {
        soundpool.play(ids['wrong']!);
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: AutoSizeText(
                      '$currentNumber',
                      style: const TextStyle(fontSize: 60),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ticker.isTicking
                        ? NumberButtonsBuilder(
                            numbers: numbers,
                            isVisibles: isVisibles,
                            onNumberTapDown: onNumberTapDown,
                          )
                        : LayoutBuilder(
                            builder: (context, constraints) {
                              return SizedBox(
                                height: constraints.maxWidth,
                              );
                            },
                          ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: AutoSizeText(
                      timeFormatter(playTime),
                      style: const TextStyle(fontSize: 60),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: ticker.isTicking
                        ? PauseButton(
                            buttonStyle: widget.buttonStyle,
                            whenPaused: whenPaused,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: [1, 2, 3].contains(countdown.inSeconds),
            child: Conutdown(countdown: countdown),
          ),
        ],
      ),
    );
  }
}

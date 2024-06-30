import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:one_to_fifty/services/play_service.dart';
import 'package:one_to_fifty/widgets/number_button_widget.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

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
        numbers[index] = secondNumbers[index];
        currentNumber++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return isVisibles[index]
                      ? NumberButton(
                          number: numbers[index],
                          onPressed: () => onNumberPressed(index),
                        )
                      : const SizedBox.shrink();
                },
              ),
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
              child: IconButton(
                onPressed: () => ticker.isTicking
                    ? setState(() {
                        pausedTime = playTime;
                        ticker.stop();
                      })
                    : ticker.start(),
                icon: const Icon(Icons.pause_rounded, size: 80),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder?>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

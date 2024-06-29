import 'package:flutter/material.dart';
import 'package:one_to_fifty/services/play_service.dart';

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

  @override
  void initState() {
    super.initState();
    numbers = firstNumbers;
  }

  void onNumberPressed(int index) {
    if (numbers[index] == currentNumber) {
      setState(() {
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
                  return TextButton(
                    onPressed: () => onNumberPressed(index),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder?>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side:
                              const BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                    child: Text(
                      '${numbers[index]}',
                      style: const TextStyle(fontSize: 40),
                    ),
                  );
                },
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                '00 : 00',
                style: TextStyle(fontSize: 60),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: IconButton(
                onPressed: () {},
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

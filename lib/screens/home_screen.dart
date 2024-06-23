import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Column(
        children: [
          const Flexible(
            flex: 3,
            child: Center(
              child: Text(
                '1 to 50',
                style: TextStyle(fontSize: 60),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.format_list_numbered_rounded, size: 80),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder?>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow_rounded, size: 80),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder?>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

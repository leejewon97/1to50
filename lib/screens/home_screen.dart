import 'package:flutter/material.dart';
import 'package:one_to_fifty/widgets/play_button_widget.dart';

class HomeScreen extends StatelessWidget {
  final ButtonStyle buttonStyle;

  const HomeScreen({
    super.key,
    required this.buttonStyle,
  });

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
                  style: buttonStyle,
                ),
                PlayButton(
                  buttonStyle: buttonStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

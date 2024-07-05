import 'package:flutter/material.dart';
import 'package:one_to_fifty/widgets/play_button_widget.dart';
import 'package:one_to_fifty/widgets/record_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  final ButtonStyle buttonStyle;
  final SharedPreferences prefs;

  const HomeScreen({
    super.key,
    required this.buttonStyle,
    required this.prefs,
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
                RecordButton(
                  buttonStyle: buttonStyle,
                  prefs: prefs,
                ),
                PlayButton(
                  buttonStyle: buttonStyle,
                  prefs: prefs,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

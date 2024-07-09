import 'package:flutter/material.dart';
import 'package:one_to_fifty/screens/play_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayButton extends StatelessWidget {
  final ButtonStyle buttonStyle;
  final SharedPreferences prefs;

  const PlayButton({
    super.key,
    required this.buttonStyle,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayScreen(
                buttonStyle: buttonStyle,
                prefs: prefs,
              ),
            ));
      },
      icon: const Icon(
        Icons.play_arrow_rounded,
        size: 80,
      ),
      style: buttonStyle,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:one_to_fifty/screens/record_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordButton extends StatelessWidget {
  final SharedPreferences prefs;
  final ButtonStyle buttonStyle;

  const RecordButton({
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
              builder: (context) => RecordScreen(
                buttonStyle: buttonStyle,
                prefs: prefs,
              ),
            ));
      },
      icon: const Icon(
        Icons.format_list_numbered_rounded,
        size: 80,
      ),
      style: buttonStyle,
    );
  }
}

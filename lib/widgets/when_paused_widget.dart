import 'package:flutter/material.dart';
import 'package:one_to_fifty/screens/play_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WhenPaused extends StatelessWidget {
  final ButtonStyle buttonStyle;
  final SharedPreferences prefs;

  const WhenPaused({
    super.key,
    required this.buttonStyle,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayScreen(
                          buttonStyle: buttonStyle,
                          prefs: prefs,
                        ),
                      ));
                },
                icon: const Icon(
                  Icons.refresh_rounded,
                  size: 80,
                ),
                style: buttonStyle,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.home_rounded,
                  size: 80,
                ),
                style: buttonStyle,
              ),
            ],
          ),
        );
      },
    );
  }
}

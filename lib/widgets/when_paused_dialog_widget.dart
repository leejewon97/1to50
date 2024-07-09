import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:one_to_fifty/screens/play_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class WhenPausedDialog extends StatelessWidget {
  final ButtonStyle buttonStyle;
  final SharedPreferences prefs;
  final Ticker ticker;

  const WhenPausedDialog({
    super.key,
    required this.buttonStyle,
    required this.prefs,
    required this.ticker,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        title: const Text(
          '일시정지',
          style: TextStyle(
            fontSize: 32,
          ),
          textAlign: TextAlign.center,
        ),
        // contentPadding: const EdgeInsets.only(top: 20, bottom: 10),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
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
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.home_rounded,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              ticker.start();
            },
            icon: const Icon(
              Icons.play_arrow_rounded,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

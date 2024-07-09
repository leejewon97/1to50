import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:one_to_fifty/widgets/buttons/home_button_widget.dart';
import 'package:one_to_fifty/widgets/buttons/restart_button_widget.dart';
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
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          RestartButton(
            buttonStyle: buttonStyle,
            prefs: prefs,
          ),
          const HomeButton(),
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

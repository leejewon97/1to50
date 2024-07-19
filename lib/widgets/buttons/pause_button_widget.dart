import 'package:flutter/material.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({
    super.key,
    required this.buttonStyle,
    required this.whenPaused,
  });

  final ButtonStyle buttonStyle;
  final void Function() whenPaused;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: whenPaused,
      icon: LayoutBuilder(builder: (context, constraints) {
        return Icon(
          Icons.pause_rounded,
          size: constraints.maxHeight * 0.75,
        );
      }),
      style: buttonStyle,
    );
  }
}

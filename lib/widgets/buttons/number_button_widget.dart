import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final int number;
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;

  const NumberButton({
    super.key,
    required this.number,
    required this.onPressed,
    required this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return TextButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Text(
            '$number',
            style: TextStyle(
              fontSize: constraints.maxWidth / 2,
            ),
          ),
        );
      },
    );
  }
}

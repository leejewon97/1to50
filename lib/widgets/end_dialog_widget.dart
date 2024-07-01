import 'package:flutter/material.dart';

class EndDialog extends StatelessWidget {
  final String playTime;

  const EndDialog({
    super.key,
    required this.playTime,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Completed!',
        style: TextStyle(
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
      ),
      content: Text(
        playTime,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
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
      ],
    );
  }
}

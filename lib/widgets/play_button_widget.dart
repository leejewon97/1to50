import 'package:flutter/material.dart';
import 'package:one_to_fifty/screens/play_screen.dart';

class PlayButton extends StatelessWidget {
  final ButtonStyle buttonStyle;

  const PlayButton({
    super.key,
    required this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayScreen(buttonStyle: buttonStyle),
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

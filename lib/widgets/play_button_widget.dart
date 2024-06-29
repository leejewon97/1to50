import 'package:flutter/material.dart';
import 'package:one_to_fifty/screens/play_screen.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayScreen(),
            ));
      },
      icon: const Icon(Icons.play_arrow_rounded, size: 80),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder?>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: Colors.black, width: 2.0),
          ),
        ),
      ),
    );
  }
}

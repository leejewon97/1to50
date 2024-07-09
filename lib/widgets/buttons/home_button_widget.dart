import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.home_rounded,
        size: 40,
      ),
    );
  }
}

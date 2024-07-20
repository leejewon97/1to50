import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter/scheduler.dart';

class ReplayButton extends StatelessWidget {
  const ReplayButton({
    super.key,
    required this.ticker,
  });

  final Ticker ticker;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
        ticker.start();
      },
      icon: const Icon(
        Icons.play_arrow_rounded,
        size: 40,
      ),
    );
  }
}

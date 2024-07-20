import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class Conutdown extends StatelessWidget {
  const Conutdown({
    super.key,
    required this.countdown,
  });

  final Duration countdown;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.25),
          body: Center(
            child: Text(
              '${countdown.inSeconds}',
              style: TextStyle(
                fontSize: constraints.maxWidth / 3,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

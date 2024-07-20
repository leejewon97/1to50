import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NumberButton extends StatelessWidget {
  final int number;
  final Function()? onNumberTapDown;

  const NumberButton({
    super.key,
    required this.number,
    required this.onNumberTapDown,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return NeumorphicButton(
          onPressed: onNumberTapDown,
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(20.0),
            ),
          ),
          padding: EdgeInsets.zero,
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                fontSize: constraints.maxWidth / 2,
                color: Colors.indigo,
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NumberButton extends StatefulWidget {
  final int number;
  final Function onNumberTapDown;

  const NumberButton({
    super.key,
    required this.number,
    required this.onNumberTapDown,
  });

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Listener(
          onPointerDown: (_) {
            widget.onNumberTapDown();
            setState(() {
              isPressed = true;
            });
            Future.delayed(const Duration(milliseconds: 200), () {
              if (mounted) {
                setState(() {
                  isPressed = false;
                });
              }
            });
          },
          child: NeumorphicButton(
            onPressed: () {},
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(20.0),
              ),
              depth: isPressed ? 0 : 5,
            ),
            padding: EdgeInsets.zero,
            child: Center(
              child: Text(
                '${widget.number}',
                style: TextStyle(
                  fontSize: constraints.maxWidth / 2,
                  color: Colors.indigo,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

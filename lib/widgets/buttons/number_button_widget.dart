import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final int number;
  final Function(TapDownDetails) onNumberTapDown;

  const NumberButton({
    super.key,
    required this.number,
    required this.onNumberTapDown,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTapDown: onNumberTapDown,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            alignment: Alignment.center,
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

import 'package:flutter/material.dart';
import 'package:one_to_fifty/widgets/number_button_widget.dart';

class NumberButtonsBuilder extends StatelessWidget {
  final List<int> numbers;
  final List<bool> isVisibles;
  final ButtonStyle buttonStyle;
  final Function(int) onNumberPressed;

  const NumberButtonsBuilder({
    super.key,
    required this.numbers,
    required this.isVisibles,
    required this.buttonStyle,
    required this.onNumberPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemCount: 25,
      itemBuilder: (context, index) {
        return isVisibles[index]
            ? NumberButton(
                number: numbers[index],
                onPressed: () => onNumberPressed(index),
                buttonStyle: buttonStyle,
              )
            : const SizedBox.shrink();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:one_to_fifty/widgets/buttons/number_button_widget.dart';

class NumberButtonsBuilder extends StatelessWidget {
  final List<int> numbers;
  final List<bool> isVisibles;
  final Function(int) onNumberTapDown;

  const NumberButtonsBuilder({
    super.key,
    required this.numbers,
    required this.isVisibles,
    required this.onNumberTapDown,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
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
                onNumberTapDown: (_) => onNumberTapDown(index),
              )
            : const SizedBox.shrink();
      },
    );
  }
}

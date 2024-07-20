import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxHeight,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: 25,
            itemBuilder: (context, index) {
              return isVisibles[index]
                  ? NumberButton(
                      number: numbers[index],
                      onNumberTapDown: () => onNumberTapDown(index),
                    )
                  : const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}

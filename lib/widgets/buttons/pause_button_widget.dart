import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/neumorphic_button_style.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({
    super.key,
    required this.whenPaused,
  });

  final void Function() whenPaused;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: whenPaused,
      style: NeumorphicButtonStyle(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Icon(
            Icons.pause_rounded,
            size: constraints.maxHeight * 0.75,
          );
        },
      ),
    );
  }
}

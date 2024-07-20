import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/neumorphic_button_style.dart';
import 'package:one_to_fifty/widgets/responsive_button_child_widget.dart';

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
      child: const ResponsiveButtonChild(
        icon: Icons.pause_rounded,
      ),
    );
  }
}

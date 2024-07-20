import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/neumorphic_button_style.dart';
import 'package:one_to_fifty/widgets/responsive_button_child_widget.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: NeumorphicButtonStyle(),
      child: const ResponsiveButtonChild(
        icon: Icons.arrow_back_rounded,
      ),
    );
  }
}

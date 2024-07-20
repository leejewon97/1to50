import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/neumorphic_button_style.dart';

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
      child: const Icon(
        Icons.arrow_back_rounded,
        size: 80,
      ),
    );
  }
}

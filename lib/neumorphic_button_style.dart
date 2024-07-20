import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NeumorphicButtonStyle extends NeumorphicStyle {
  NeumorphicButtonStyle({
    super.depth,
  }) : super(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20.0)),
        );
}

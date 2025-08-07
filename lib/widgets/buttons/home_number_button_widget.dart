import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/neumorphic_button_style.dart';
import 'package:one_to_fifty/services/play_service.dart';

class HomeNumberButton extends StatelessWidget {
  final String number;

  const HomeNumberButton({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 90,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxHeight,
              child: NeumorphicButton(
                onPressed: () {
                  PlayService.playTap();
                },
                style: NeumorphicButtonStyle(),
                padding: EdgeInsets.zero,
                child: Center(
                  child: Text(
                    number,
                    style: TextStyle(
                      fontSize: constraints.maxHeight / 2,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

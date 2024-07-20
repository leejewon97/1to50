import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/neumorphic_button_style.dart';
import 'package:one_to_fifty/screens/play_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayButton extends StatelessWidget {
  final SharedPreferences prefs;

  const PlayButton({
    super.key,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayScreen(
                prefs: prefs,
              ),
            ));
      },
      style: NeumorphicButtonStyle(),
      child: const Icon(
        Icons.play_arrow_rounded,
        size: 80,
      ),
    );
  }
}

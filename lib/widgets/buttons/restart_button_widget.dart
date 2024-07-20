import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/screens/play_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestartButton extends StatelessWidget {
  const RestartButton({
    super.key,
    required this.prefs,
  });

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PlayScreen(
                prefs: prefs,
              ),
            ));
      },
      icon: const Icon(
        Icons.refresh_rounded,
        size: 40,
      ),
    );
  }
}

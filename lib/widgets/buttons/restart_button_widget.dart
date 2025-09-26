import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/screens/play_screen.dart';
import 'package:one_to_fifty/services/ad_service.dart';
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
      onPressed: () async {
        await AdService.incrementPlayCount(prefs);
        final shouldShowAd = await AdService.shouldShowAd(prefs);
        
        void restartPlayScreen() {
          if (context.mounted) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PlayScreen(
                  prefs: prefs,
                ),
              ),
            );
          }
        }
        
        if (shouldShowAd) {
          await AdService.showInterstitialAd(restartPlayScreen);
        } else {
          restartPlayScreen();
        }
      },
      icon: const Icon(
        Icons.refresh_rounded,
        size: 40,
      ),
    );
  }
}

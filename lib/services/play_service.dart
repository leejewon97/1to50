import 'package:just_audio/just_audio.dart';

class PlayService {
  static const String _tapSound = 'assets/sounds/tap.mp3';
  static const String _wrongSound = 'assets/sounds/wrong.mp3';
  static const String _countdownSound = 'assets/sounds/countdown.wav';

  static final AudioPlayer _tapPlayer = AudioPlayer();
  static final AudioPlayer _wrongPlayer = AudioPlayer();
  static final AudioPlayer _countdownPlayer = AudioPlayer();

  static List<int> getRandomNumbers(int wave) {
    if (wave == 1) {
      return List.generate(25, (index) => index + 1)..shuffle();
    } else {
      return List.generate(25, (index) => index + 26)..shuffle();
    }
  }

  static Future<void> initialize() async {
    await _tapPlayer.setAsset(_tapSound);
    await _wrongPlayer.setAsset(_wrongSound);
    await _countdownPlayer.setAsset(_countdownSound);
    
    await _tapPlayer.load();
    await _wrongPlayer.load();
    await _countdownPlayer.load();
    
    await _preloadAudio();
  }

  static Future<void> _preloadAudio() async {
    await _tapPlayer.setVolume(0.0);
    await _wrongPlayer.setVolume(0.0);
    await _countdownPlayer.setVolume(0.0);

    await _tapPlayer.play();
    await _wrongPlayer.play();
    await _countdownPlayer.play();

    await Future.delayed(const Duration(milliseconds: 50));

    await _tapPlayer.stop();
    await _wrongPlayer.stop();
    await _countdownPlayer.stop();

    await _tapPlayer.setVolume(1.0);
    await _wrongPlayer.setVolume(1.0);
    await _countdownPlayer.setVolume(1.0);
  }

  static Future<void> playTap() async {
    await _tapPlayer.seek(Duration.zero);
    await _tapPlayer.play();
  }

  static Future<void> playWrong() async {
    await _wrongPlayer.seek(Duration.zero);
    await _wrongPlayer.play();
  }

  static Future<void> playCountdown() async {
    await _countdownPlayer.seek(Duration.zero);
    await _countdownPlayer.play();
  }

  static void dispose() {
    _tapPlayer.dispose();
    _wrongPlayer.dispose();
    _countdownPlayer.dispose();
  }
}

import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class PlayService {
  List<int> getRandomNumbers(int wave) {
    if (wave == 1) {
      return List.generate(25, (index) => index + 1)..shuffle();
    } else {
      return List.generate(25, (index) => index + 26)..shuffle();
    }
  }

  Future<Map<String, int>> getSoundIds(Soundpool soundpool) async {
    return {
      'tap': await loadSound('assets/sounds/tap.mp3', soundpool),
      'wrong': await loadSound('assets/sounds/wrong.mp3', soundpool),
      'countdown': await loadSound('assets/sounds/countdown.wav', soundpool),
    };
  }

  Future<int> loadSound(String file, Soundpool soundpool) async {
    var soundData = await rootBundle.load(file);
    return await soundpool.load(soundData);
  }
}

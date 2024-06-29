class PlayService {
  List<int> getRandomNumbers(int wave) {
    if (wave == 1) {
      return List.generate(25, (index) => index + 1)..shuffle();
    } else {
      return List.generate(25, (index) => index + 26)..shuffle();
    }
  }
}

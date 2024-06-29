class PlayService {
  List<int> getRandomNumbers() {
    return List.generate(25, (index) => index + 1)..shuffle();
  }
}

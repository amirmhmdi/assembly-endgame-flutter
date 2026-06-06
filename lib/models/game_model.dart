class GameModel {
  final String currentWord;
  final String guessedLetters;
  final int wrongCount;
  final bool isGameOver;
  final bool isWon;
  final bool isLastLetterCorrect;

  GameModel({
    required this.currentWord,
    required this.guessedLetters,
    required this.wrongCount,
    required this.isGameOver,
    required this.isWon,
    required this.isLastLetterCorrect,
  });

  factory GameModel.initial(String word) {
    return GameModel(
      currentWord: word,
      guessedLetters: "",
      wrongCount: 0,
      isGameOver: false,
      isWon: false,
      isLastLetterCorrect: true,
    );
  }

  GameModel copyWith({
    String? currentWord,
    String? guessedLetters,
    int? wrongCount,
    bool? isGameOver,
    bool? isWon,
    bool? isLastLetterCorrect,
  }) {
    return GameModel(
      currentWord: currentWord ?? this.currentWord,
      guessedLetters: guessedLetters ?? this.guessedLetters,
      wrongCount: wrongCount ?? this.wrongCount,
      isGameOver: isGameOver ?? this.isGameOver,
      isWon: isWon ?? this.isWon,
      isLastLetterCorrect: isLastLetterCorrect ?? this.isLastLetterCorrect,
    );
  }
}

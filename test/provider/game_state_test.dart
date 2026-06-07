import 'package:assembly_endgame/provider/game_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('GameState Provider Tests', () {
    test('Initial state is correct', () {
      final container = createContainer();
      final state = container.read(gameStateProvider);

      expect(state.currentWord, isNotEmpty);
      expect(state.guessedLetters, "");
      expect(state.wrongCount, 0);
      expect(state.isGameOver, false);
      expect(state.isWon, false);
    });

    test('Adding a correct letter updates state correctly', () {
      final container = createContainer();
      final word = container.read(gameStateProvider).currentWord;
      final firstLetter = word[0];

      container.read(gameStateProvider.notifier).addLetter(firstLetter);
      final state = container.read(gameStateProvider);

      expect(state.guessedLetters, contains(firstLetter));
      expect(state.wrongCount, 0);
      expect(state.isLastLetterCorrect, true);
    });

    test('Adding an incorrect letter updates wrongCount', () {
      final container = createContainer();
      // Use a letter that is definitely not in the word (keyboard has a-z)
      // For simplicity, we find one.
      final word = container.read(gameStateProvider).currentWord;
      String wrongLetter = '0';
      for (var char in 'abcdefghijklmnopqrstuvwxyz'.toUpperCase().split('')) {
        if (!word.contains(char)) {
          wrongLetter = char;
          break;
        }
      }

      container.read(gameStateProvider.notifier).addLetter(wrongLetter);
      final state = container.read(gameStateProvider);

      expect(state.wrongCount, 1);
      expect(state.isLastLetterCorrect, false);
    });

    test('Win condition is triggered when all letters are guessed', () {
      final container = createContainer();
      final word = container.read(gameStateProvider).currentWord;
      
      for (var char in word.split('')) {
        container.read(gameStateProvider.notifier).addLetter(char);
      }

      final state = container.read(gameStateProvider);
      expect(state.isWon, true);
      expect(state.isGameOver, false);
    });

    test('Game over is triggered after max wrong guesses', () {
      final container = createContainer();
      final word = container.read(gameStateProvider).currentWord;
      
      int wrongCount = 0;
      for (var char in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')) {
        if (!word.contains(char)) {
          container.read(gameStateProvider.notifier).addLetter(char);
          wrongCount++;
          if (wrongCount >= 9) break; // languagesList.length is 9
        }
      }

      final state = container.read(gameStateProvider);
      expect(state.isGameOver, true);
      expect(state.isWon, false);
    });
  });
}

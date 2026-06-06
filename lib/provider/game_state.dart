import 'dart:math';

import 'package:assembly_endgame/models/game_model.dart';
import 'package:assembly_endgame/utils/languages.dart';
import 'package:assembly_endgame/utils/word_list.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_state.g.dart';

@riverpod
class GameState extends _$GameState {
  @override
  GameModel build() {
    return GameModel.initial(_getRandomWord());
  }

  String _getRandomWord() {
    return wordsList[Random().nextInt(wordsList.length)].toUpperCase();
  }

  void reset() {
    state = GameModel.initial(_getRandomWord());
  }

  void addLetter(String letter) {
    if (state.isGameOver || state.isWon) return;

    if (!state.guessedLetters.contains(letter)) {
      final newGuessedLetters = state.guessedLetters + letter;
      final isLastLetterCorrect = state.currentWord.contains(letter);
      
      int newWrongCount = state.wrongCount;
      if (!isLastLetterCorrect) {
        newWrongCount++;
      }

      final isWon = state.currentWord
          .split("")
          .every((element) => newGuessedLetters.contains(element));
      
      final isGameOver = newWrongCount > languagesList.length - 1;

      state = state.copyWith(
        guessedLetters: newGuessedLetters,
        wrongCount: newWrongCount,
        isWon: isWon,
        isGameOver: isGameOver,
        isLastLetterCorrect: isLastLetterCorrect,
      );
    }
  }

  String shouldShowLetter(String letter) {
    if (state.isGameOver || state.isWon) {
      return letter;
    }
    return state.guessedLetters.contains(letter) ? letter : "";
  }

  Color letterColor(String letter) {
    if (state.isWon || state.isGameOver) {
      if (state.guessedLetters.contains(letter)) {
        return Colors.white;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.white;
    }
  }

  bool checkLetter(String letter) {
    return state.guessedLetters.contains(letter);
  }

  Color keyboardColor(String letter) {
    if (state.guessedLetters.contains(letter)) {
      if (state.currentWord.contains(letter)) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.orange;
    }
  }
}

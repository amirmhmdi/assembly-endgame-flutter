import 'dart:math';

import 'package:assembly_endgame/utils/languages.dart';
import 'package:assembly_endgame/utils/word_list.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_state.g.dart';

@riverpod
class GameState extends _$GameState {
  String _currentWord = "";
  int _wrongCount = 0;
  bool _isGameOver = false;
  bool _isWon = false;

  @override
  String build() {
    _currentWord = _setCurrentWord();
    return "";
  }

  String _setCurrentWord() {
    return wordsList[Random().nextInt(wordsList.length)].toUpperCase();
  }

  void reset() {
    _currentWord = _setCurrentWord();
    _wrongCount = 0;
    _isGameOver = false;
    _isWon = false;
    state = "";
  }

  String getCurrentWord() => _currentWord;

  int get wrongCount => _wrongCount;
  bool get isGameOver => _isGameOver;
  bool get isWon => _isWon;

  void addLetter(String letter) {
    if (!state.contains(letter)) {
      state += letter;
      if (_currentWord.split("").every((element) => state.contains(element))) {
        _isWon = true;
      }
      if (!_currentWord.contains(letter)) {
        _wrongCount++;
        if (_wrongCount > languagesList.length - 1) {
          _isGameOver = true;
        }
      }
    }
  }

  String shouldShowLetter(String letter) {
    if (_isGameOver || _isWon) {
      return letter;
    }
    return state.contains(letter) ? letter : "";
  }

  Color letterColor(String letter) {
    if (_isWon || _isGameOver) {
      if (state.contains(letter)) {
        return Colors.white;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.white;
    }
  }

  bool checkLetter(String letter) {
    return state.contains(letter);
  }

  Color keyboardColor(String letter) {
    if (state.contains(letter)) {
      if (_currentWord.contains(letter)) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.orange;
    }
  }

  bool isLastLetterCorrect() =>
      _currentWord.contains(state.isNotEmpty ? state[state.length - 1] : "");
}

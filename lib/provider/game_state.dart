import 'dart:math';

import 'package:assembly_endgame/utils/word_list.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_state.g.dart';

@riverpod
class GameState extends _$GameState {
  String _currentWord = "";
  int _wrongCount = 0;

  @override
  String build() {
    _currentWord = _setCurrentWord();
    return "";
  }

  String _setCurrentWord() {
    return "FLUTTER";
    // return wordsList[Random().nextInt(wordsList.length)].toUpperCase();
  }

  String getCurrentWord() => _currentWord;

  int wrongCount() => _wrongCount;

  void addLetter(String letter) {
    if (!state.contains(letter)) {
      if (!_currentWord.contains(letter)) {
        _wrongCount++;
      }
      state += letter;
    }
  }

  String shouldShowLetter(String letter) {
    return state.contains(letter) ? letter : "";
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
      return Colors.grey;
    }
  }
}

import 'package:assembly_endgame/models/game_model.dart';
import 'package:assembly_endgame/presentation/widgets/keyboard_widget.dart';
import 'package:assembly_endgame/provider/game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeGameState extends GameState {
  final GameModel initialState;
  FakeGameState(this.initialState);

  @override
  GameModel build() => initialState;

  @override
  Color keyboardColor(String letter) => Colors.orange;

  @override
  void addLetter(String letter) {}
}

void main() {
  group('KeyboardWidget Tests', () {
    testWidgets('Keyboard buttons are enabled during active play',
        (WidgetTester tester) async {
      final initialState = GameModel.initial("TEST");

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            gameStateProvider.overrideWith(() => FakeGameState(initialState)),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: KeyboardWidget(),
            ),
          ),
        ),
      );

      final aButton = tester.widget<TextButton>(find.widgetWithText(TextButton, 'A'));
      expect(aButton.onPressed, isNotNull);
    });

    testWidgets('Keyboard buttons are disabled when game is over',
        (WidgetTester tester) async {
      final gameOverState = GameModel.initial("TEST").copyWith(isGameOver: true);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            gameStateProvider.overrideWith(() => FakeGameState(gameOverState)),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: KeyboardWidget(),
            ),
          ),
        ),
      );

      final aButton = tester.widget<TextButton>(find.widgetWithText(TextButton, 'A'));
      expect(aButton.onPressed, isNull);
    });

    testWidgets('Keyboard buttons are disabled when game is won',
        (WidgetTester tester) async {
      final gameWonState = GameModel.initial("TEST").copyWith(isWon: true);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            gameStateProvider.overrideWith(() => FakeGameState(gameWonState)),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: KeyboardWidget(),
            ),
          ),
        ),
      );

      final aButton = tester.widget<TextButton>(find.widgetWithText(TextButton, 'A'));
      expect(aButton.onPressed, isNull);
    });
  });
}

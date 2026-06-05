import 'package:assembly_endgame/provider/game_state.dart';
import 'package:assembly_endgame/utils/languages.dart';
import 'package:assembly_endgame/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusWidget extends ConsumerWidget {
  const StatusWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameStateProvider);
    print("is game over ${ref.read(gameStateProvider.notifier).isGameOver}");
    print("is won ${ref.read(gameStateProvider.notifier).isWon}");
    if (ref.read(gameStateProvider.notifier).isGameOver) {
      return Container(
        height: 55,
        width: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: "Game over!\n",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            children: [
              TextSpan(
                text: "You lose! Better start learning Assembly 😭",
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 14, height: 1.5),
                //  style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
    } else if (ref.read(gameStateProvider.notifier).isWon) {
      return Container(
        height: 55,
        width: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: "You win!\n",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            children: [
              TextSpan(
                text: "🎉 Well done! 🎉",
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 14, height: 1.5),
              )
            ],
          ),
        ),
      );
    } else if (!ref.read(gameStateProvider.notifier).isLastLetterCorrect()) {
      return Container(
        height: 55,
        width: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          getFarewellText(
            languagesList[ref.read(gameStateProvider.notifier).wrongCount - 1]
                ['name']!,
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      );
    } else {
      return const SizedBox(
        height: 55,
        width: 300,
      );
    }
  }
}

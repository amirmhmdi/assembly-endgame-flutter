import 'package:assembly_endgame/provider/game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewGameButton extends ConsumerWidget {
  const NewGameButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(gameStateProvider);
    return (ref.read(gameStateProvider.notifier).isGameOver ||
            ref.read(gameStateProvider.notifier).isWon)
        ? ElevatedButton(
            onPressed: () {
              ref.read(gameStateProvider.notifier).reset();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 50),
              // padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 12),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(width: 1, color: Colors.white),
              ),
            ),
            child: const Text(
              "New Game",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          )
        : const SizedBox(width: 200, height: 50);
  }
}

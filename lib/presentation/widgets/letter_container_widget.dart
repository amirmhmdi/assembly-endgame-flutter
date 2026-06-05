import 'package:assembly_endgame/provider/game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LetterContainerWidget extends ConsumerWidget {
  const LetterContainerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameStateProvider);
    final String currentWord =
        ref.watch(gameStateProvider.notifier).getCurrentWord();
    return Wrap(
      alignment: WrapAlignment.center,
      children: currentWord
          .toUpperCase()
          .split("")
          .map((e) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.all(4),
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border(bottom: BorderSide(color: Colors.white)),
                ),
                child: Text(
                  ref.read(gameStateProvider.notifier).shouldShowLetter(e),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ref.read(gameStateProvider.notifier).letterColor(e),
                    fontSize: 24,
                  ),
                ),
              ))
          .toList(),
    );
  }
}

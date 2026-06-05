import 'package:assembly_endgame/provider/game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeyboardWidget extends ConsumerWidget {
  const KeyboardWidget({super.key});

  final String keys = 'abcdefghijklmnopqrstuvwxyz';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameStateProvider);
    return Container(
      padding: const EdgeInsets.all(8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: keys
            .toUpperCase()
            .split("")
            .map((letter) => TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(35, 35),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: ref.read(gameStateProvider.notifier).keyboardColor(letter),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(width: 1, color: Colors.white),
                    ),
                  ),
                  child: Text(
                    letter,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    ref.read(gameStateProvider.notifier).addLetter(letter);
                  },
                ))
            .toList(),
      ),
    );
  }
}

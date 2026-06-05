import 'package:assembly_endgame/provider/game_state.dart';
import 'package:assembly_endgame/utils/languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChipsWidget extends ConsumerWidget {
  const ChipsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameStateProvider);
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: languagesList.asMap().entries.map((element) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Chip(
              elevation: 0.0,
              label: Text(
                element.value['name']!,
                style: TextStyle(
                    color:
                        Color(int.parse(element.value['color']!, radix: 16))),
              ),
              backgroundColor: Color(
                int.parse(element.value['backgroundColor']!, radix: 16),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
              ),
            ),
            if (element.key < ref.read(gameStateProvider.notifier).wrongCount())
              Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text("💀"),
                ),
              ),
          ],
        );
      }).toList(),
    );
  }
}

import 'package:assembly_endgame/utils/languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChipsWidget extends ConsumerWidget {
  const ChipsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: languagesList
            .map(
              (element) => Chip(
                elevation: 0.0,
                label: Text(
                  element['name']!,
                  style: TextStyle(
                      color: Color(int.parse(element['color']!, radix: 16))),
                ),
                backgroundColor: Color(
                  int.parse(element['backgroundColor']!, radix: 16),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

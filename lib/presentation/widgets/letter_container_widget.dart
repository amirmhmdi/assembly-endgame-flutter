import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LetterContainerWidget extends ConsumerWidget {
  const LetterContainerWidget({super.key});

  final String text = "flutter";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: text
          .toUpperCase()
          .split("")
          .map((e) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border(bottom: BorderSide(color: Colors.white)),
                ),
                child: Text(
                  e,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ))
          .toList(),
    );
  }
}

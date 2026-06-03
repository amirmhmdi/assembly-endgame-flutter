import 'package:assembly_endgame/presentation/widgets/chips_widget.dart';
import 'package:assembly_endgame/presentation/widgets/header_widget.dart';
import 'package:assembly_endgame/presentation/widgets/keyboard_widget.dart';
import 'package:assembly_endgame/presentation/widgets/letter_container_widget.dart';
import 'package:assembly_endgame/presentation/widgets/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const HeaderWidget(),
            const StatusWidget(),
            const ChipsWidget(),
            const LetterContainerWidget(),
            const KeyboardWidget(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 64, vertical: 12),
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
          ],
        ),
      ),
    );
  }
}

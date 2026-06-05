import 'package:assembly_endgame/presentation/widgets/chips_widget.dart';
import 'package:assembly_endgame/presentation/widgets/header_widget.dart';
import 'package:assembly_endgame/presentation/widgets/keyboard_widget.dart';
import 'package:assembly_endgame/presentation/widgets/letter_container_widget.dart';
import 'package:assembly_endgame/presentation/widgets/new_game_button.dart';
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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HeaderWidget(),
            StatusWidget(),
            ChipsWidget(),
            LetterContainerWidget(),
            KeyboardWidget(),
            NewGameButton()
          ],
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:assembly_endgame/provider/game_state.dart';
import 'package:assembly_endgame/utils/languages.dart';
import 'package:assembly_endgame/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:confetti/confetti.dart';

class StatusWidget extends ConsumerStatefulWidget {
  const StatusWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends ConsumerState<StatusWidget> {
  ConfettiController? controller;
  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(gameStateProvider.select((s) => s.isWon), (prev, next) {
      if (next) {
        controller!.play();
      }
    });

    final game = ref.watch(gameStateProvider);
    if (game.isGameOver) {
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
    } else if (game.isWon) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConfettiWidget(
            confettiController: controller!,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: true,
            createParticlePath: drawStar,
          ),
          Container(
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
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        height: 1.5),
                  )
                ],
              ),
            ),
          ),
          ConfettiWidget(
            confettiController: controller!,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: true,
            createParticlePath: drawStar,
          ),
        ],
      );
    } else if (!game.isLastLetterCorrect) {
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
            languagesList[game.wrongCount - 1]['name']!,
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

  Path drawStar(Size size) {
    // Method to convert degrees to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}

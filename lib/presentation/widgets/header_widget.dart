import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: "Assembly: Endgame\n",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
          children: [
            TextSpan(
              text:
                  "Guess the word in under 8 attempts to keep the programming world safe from Assembly!",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                // height: 1.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

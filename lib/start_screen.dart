import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;
  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/img/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w600,
              fontFamily: 'Arial',
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

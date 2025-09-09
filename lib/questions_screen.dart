import 'package:advanced_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:advanced_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: AnswerButton(
                  answer,
                  onPress: () => answerQuestion(answer),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

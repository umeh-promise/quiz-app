import 'package:advanced_basics/data/questions.dart';
import 'package:advanced_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() restartQuiz;
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
  });

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int idx = 0; idx < chosenAnswers.length; idx++) {
      summary.add({
        'id': idx,
        'question': questions[idx].question,
        'correct_answer': questions[idx].answers[0],
        'selected_answer': chosenAnswers[idx],
        "is_correct_answer": questions[idx].answers[0] == chosenAnswers[idx],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((item) {
      return item['is_correct_answer'] as bool;
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(40),
        alignment: AlignmentGeometry.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 30,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData),
            SizedBox(height: 35),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 21, 0, 0),
                textStyle: TextStyle(fontSize: 24),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              ),
              icon: Icon(
                Icons.restore_outlined,
                size: 25,
              ),
              label: Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}

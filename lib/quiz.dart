import 'package:advanced_basics/data/questions.dart';
import 'package:advanced_basics/questions_screen.dart';
import 'package:advanced_basics/results_screen.dart';
import 'package:advanced_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

enum ActiveQuizScreen { startScreen, questionsScreen, resultsScreen }

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  ActiveQuizScreen _activeScreen = ActiveQuizScreen.startScreen;

  void switchScreen() {
    setState(() {
      _activeScreen = ActiveQuizScreen.questionsScreen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = ActiveQuizScreen.resultsScreen;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      _activeScreen = ActiveQuizScreen.questionsScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screenWidget;

    switch (_activeScreen) {
      case ActiveQuizScreen.questionsScreen:
        screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
      case ActiveQuizScreen.resultsScreen:
        screenWidget = ResultsScreen(
          chosenAnswers: selectedAnswers,
          restartQuiz: restartQuiz,
        );
      default:
        screenWidget = StartScreen(switchScreen);
    }

    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 68, 3, 104),
              const Color.fromARGB(255, 108, 28, 139),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: screenWidget,
      ),
    );
  }
}

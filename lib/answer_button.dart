import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final void Function() onPress;
  const AnswerButton(this.answerText, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 49, 0, 147),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        child: Text(
          answerText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

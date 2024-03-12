import 'package:flutter/material.dart';
import 'package:adv_basics/style/styled_text.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.text, this.onClick, {super.key});

  final String text;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        ),
        child: StyledText(
          text: text,
          textAlign: TextAlign.center,
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

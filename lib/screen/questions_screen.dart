import 'package:flutter/material.dart';
import 'package:adv_basics/style/styled_text.dart';
import 'package:adv_basics/style/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final questionCounter = "$currentQuestionIndex/${questions.length}";
    final progressValue = (currentQuestionIndex) / questions.length;

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StyledText(
            text: currentQuestion.question,
            textAlign: TextAlign.center,
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(answer, () {
              answerQuestion(answer);
            });
          }),
          const SizedBox(height: 100),
          StyledText(
            text: questionCounter,
            textAlign: TextAlign.center,
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.grey,
            valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.blue), // Colore della barra di avanzamento
          ),
        ],
      ),
    );
  }
}

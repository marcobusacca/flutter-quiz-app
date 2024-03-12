import 'package:flutter/material.dart';
import 'package:adv_basics/results_summary/results_summary.dart';
import 'package:adv_basics/style/styled_text.dart';
import 'package:adv_basics/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i + 1,
        'question': questions[i].question,
        'user_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    final numTotalQuestions = questions.length;

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StyledText(
            text:
                "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
            textAlign: TextAlign.center,
            color: const Color.fromARGB(255, 217, 146, 235),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 30),
          ResultsSummary(summaryData),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: onRestart,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.refresh),
            label: const StyledText(
              text: 'Restart Quiz!',
              textAlign: TextAlign.center,
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

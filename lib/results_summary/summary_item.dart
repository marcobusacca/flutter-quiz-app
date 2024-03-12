import 'package:flutter/material.dart';
import 'package:adv_basics/results_summary/result_identifier.dart';
import 'package:adv_basics/style/styled_text.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResultIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'].toString(),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledText(
                  text: itemData['question'].toString(),
                  textAlign: TextAlign.left,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 5),
                StyledText(
                  text: itemData['user_answer'].toString(),
                  textAlign: TextAlign.left,
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                StyledText(
                  text: itemData['correct_answer'].toString(),
                  textAlign: TextAlign.left,
                  color: Colors.lightBlue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

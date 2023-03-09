import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  const Quiz(
      {super.key,
      required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Question(
          questionText: questions[questionIndex]['questText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((e) {
          return Answer(
            selectHandler: () => answerQuestion(e['score']),
            answerText: e['text'] as String,
          );
        }).toList()
      ],
    );
  }
}

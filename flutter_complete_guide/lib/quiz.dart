import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int index;

  Quiz(@required this.questions,@required this.answerQuestion,@required this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Question(questions[index]['questionText'] as String),
            ...(questions[index]['answers'] as List<Map<String, Object>>)
                .map((answer) {
              return Answer(() => answerQuestion(answer['score']), answer['text']);
            }).toList()
          ],
        );
  }
}
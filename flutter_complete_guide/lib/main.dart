import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import './question.dart';
import './answer.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  final questions = const [
    {
      'questionText': 'what color', 
      'answers': [{'text':'Black', 'score':10}, {'text':'Red', 'score':5}, {'text':'Green', 'score':2}]
    },
    {
      'questionText': 'what animal',
      'answers': [{'text':'Cow', 'score':1}, {'text':'Snake', 'score':6}, {'text':'lion', 'score':8}]
    },
    {
      'questionText': 'what instructor', 
      'answers': [{'text':'Max', 'score':1}, {'text':'Angela', 'score':6}, {'text':'Adam', 'score':8}]
    }
  ];

  void answerQuestion(int score) {
    totalScore += score;
    
    setState(() {
      questionIndex += 1;
    });
    print(questionIndex);
  }

  void reset() {
    setState(() {
      questionIndex = 0;
    });
  }

  var totalScore = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HeyHeyHey'),
        ),
        body: questionIndex < questions.length ? Quiz(questions, answerQuestion, questionIndex):  Result(totalScore, reset),
      ),
    );
  }
}

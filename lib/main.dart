import 'dart:developer';

import 'package:corso_01/quiz.dart';
import 'package:corso_01/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

//Il leading _ converte public to private
class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questText': 'Colore Preferito?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 0},
        {'text': 'Blue', 'score': 10},
        {'text': 'Green', 'score': 5}
      ],
    },
    {
      'questText': 'Animale preferito?',
      'answers': [
        {'text': 'Rabbit', 'score': 0},
        {'text': 'Hawk', 'score': 10},
        {'text': 'Snake', 'score': 8},
        {'text': 'Lion', 'score': 5}
      ],
    },
    {
      'questText': 'Linguaggio preferito?',
      'answers': [
        {'text': 'C++', 'score': 8},
        {'text': 'Cobol', 'score': -100},
        {'text': 'Python', 'score': 10},
        {'text': 'JS', 'score': 10}
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < _questions.length) {
      // debugger(when: _questionIndex > 1);
      log("ci sono altre _questions");
    } else {
      log("FINE!!!");
    }
  }

  @override
  //ogni volta che flutter inizia l'esecuzione della build e resetta tutte le variabili
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Titolo!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                resultScore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}

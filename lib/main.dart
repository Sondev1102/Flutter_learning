import 'package:flutter/material.dart';
import 'package:flutter_app_testing/finish.dart';
import 'package:flutter_app_testing/hold.dart';
import 'package:flutter_app_testing/question/questions.dart';

void main() {
  runApp(MyApp());
}

enum KeysQuestions { questionText, answers }

enum KeysAnswers { text, isCorrect }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyApp();
}

enum AppState { hold, start, finish }

class _MyApp extends State<MyApp> {
  final List<Map<KeysQuestions, Object>> questions = [
    {
      KeysQuestions.questionText: 'I dislike ________ to the movies by myself.',
      KeysQuestions.answers: [
        {KeysAnswers.text: 'going', KeysAnswers.isCorrect: true},
        {KeysAnswers.text: 'to go', KeysAnswers.isCorrect: false},
        {KeysAnswers.text: 'going/to go', KeysAnswers.isCorrect: false},
      ]
    },
    {
      KeysQuestions.questionText: 'We started ________ dinner without you.',
      KeysQuestions.answers: [
        {KeysAnswers.text: 'eating', KeysAnswers.isCorrect: false},
        {KeysAnswers.text: 'to eat', KeysAnswers.isCorrect: false},
        {KeysAnswers.text: 'eating/to eat', KeysAnswers.isCorrect: true},
      ]
    },
    {
      KeysQuestions.questionText: 'I can\'t imagine ________ my own house.',
      KeysQuestions.answers: [
        {KeysAnswers.text: 'buying', KeysAnswers.isCorrect: true},
        {KeysAnswers.text: 'to buy', KeysAnswers.isCorrect: false},
        {KeysAnswers.text: 'buying/to buy', KeysAnswers.isCorrect: false},
      ]
    },
    {
      KeysQuestions.questionText:
          'I used ________ that television show all the time.',
      KeysQuestions.answers: [
        {KeysAnswers.text: 'watching', KeysAnswers.isCorrect: false},
        {KeysAnswers.text: 'to watch', KeysAnswers.isCorrect: true},
        {KeysAnswers.text: 'watching/to watch', KeysAnswers.isCorrect: false},
      ]
    },
  ];

  AppState _appState = AppState.hold;
  var _totalScore = 0;

  void handleFinish() {
    setState(() {
      _appState = AppState.finish;
    });
  }

  void handleStart() {
    setState(() {
      _appState = AppState.start;
      _totalScore = 0;
    });
  }

  void handleExit() {
    setState(() {
      _appState = AppState.hold;
      _totalScore = 0;
    });
  }

  void changeScore(int score) {
    setState(() {
      _totalScore += score;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_appState);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test English app'),
        ),
        body: _appState == AppState.hold
            ? Hold(handleStart)
            : _appState == AppState.start
                ? Questions(
                    changeScore: changeScore,
                    handleFinish: handleFinish,
                    questions: questions,
                  )
                : Finish(
                    handleExit: handleExit,
                    handleRetry: handleStart,
                    totalScore: _totalScore,
                    questions: questions,
                  ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

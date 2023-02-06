import 'package:flutter/material.dart';
import 'package:flutter_app_testing/main.dart';

class Questions extends StatefulWidget {
  Function handleFinish;
  Function changeScore;
  final List<Map<KeysQuestions, Object>> questions;
  Questions(
      {required this.handleFinish,
      required this.questions,
      required this.changeScore});
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var questionsIndex = 0;
  void handleAnswer(Map<KeysAnswers, Object> answer) {
    setState(() {
      if (answer[KeysAnswers.isCorrect] as bool) widget.changeScore(1);
      if (questionsIndex == widget.questions.length - 1) {
        widget.handleFinish();
      } else {
        questionsIndex += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.questions[questionsIndex][KeysQuestions.questionText]
                  as String,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          ...(widget.questions[questionsIndex][KeysQuestions.answers]
                  as List<Map<KeysAnswers, Object>>)
              .map(
            (answer) => ElevatedButton(
              onPressed: () => handleAnswer(answer),
              child: Text(
                answer[KeysAnswers.text] as String,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.black),
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                '${questionsIndex + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_testing/main.dart';

class Finish extends StatelessWidget {
  Function handleRetry;
  Function handleExit;
  final totalScore;
  final List<Map<KeysQuestions, Object>> questions;

  Finish(
      {required this.handleRetry,
      required this.handleExit,
      required this.totalScore,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Score: $totalScore / ${questions.length}',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => handleRetry(),
                child: const Text(
                  'Try Again',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () => handleExit(),
                child: const Text(
                  'Exit',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

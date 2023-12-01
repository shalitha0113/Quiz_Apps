import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onAction});

  final Function(String value) onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-cover.webp',
            width: 300,
          ),
           const SizedBox(
            height: 20,
          ),
          const Text(
            'Let\'s do some Quiz..',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
              onPressed: () {
                onAction('quiz');
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: const Text('Start Quiz'))
        ],
      ),
    );
  }
}

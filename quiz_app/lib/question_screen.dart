import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';



class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key, required this.onAnswer, required this.onAction});

  final Function(String value) onAnswer;
  final Function(String value) onAction;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].questions,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 28),
            ),
            const SizedBox(
              height: 20,
            ),
            ...questions[currentQuestionIndex]
                .getRandomAnswers()
                .map((answer) => AnswerButton(
                    value: answer,
                    onAnswer: () {
                      answerQuestion(answer);
                    })),
            const SizedBox(
              height: 40,
            ),
            LinearProgressIndicator(
                value: 0.1 * (currentQuestionIndex + 1),
                minHeight: 10,
                backgroundColor: const Color.fromARGB(255, 212, 205, 205),
                valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 51, 206, 56))),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                onPressed: () {
                  widget.onAction('start');
                },
                child: const Text('Back to Start',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 18, 52, 145))))
          ],
        ),
      ),
    );
  }
}

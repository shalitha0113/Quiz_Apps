import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.answerList, required this.onAction});

  final List<String> answerList;
  final Function(String value) onAction;

  @override
  Widget build(BuildContext context) {
    int numberOfCurrentAnswer = 0;

    List<Map<String, Object>> summary = [];

    Color color;
    String remarks;

    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].questions,
        'correct_answer': questions[i].answers[0],
        'user_answer': answerList[i],
      });
    }

    //check no of correct answers
    for (var j = 0; j < summary.length; j++) {
      if (summary[j]['user_answer'] == summary[j]['correct_answer']) {
        numberOfCurrentAnswer++;
      }
    }

    if (numberOfCurrentAnswer >= 7) {
      color = Colors.green;
      remarks = "Great";
    } else if (numberOfCurrentAnswer >= 5) {
      color = Colors.teal;
      remarks = "Fair";
    } else {
      color = Colors.orange;
      remarks = "Weaks";
    }

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Result Screen',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              
              value: 0.1*numberOfCurrentAnswer,
              backgroundColor: const Color.fromARGB(255, 211, 208, 208),
              strokeWidth: 10.0,
              valueColor: numberOfCurrentAnswer>=7 ? const AlwaysStoppedAnimation<Color>(Colors.green):numberOfCurrentAnswer>=5 ?const AlwaysStoppedAnimation<Color>(Colors.teal) :const AlwaysStoppedAnimation<Color>(Colors.orange), 
            ),
             const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: color
                ) ,
                child: Text("$numberOfCurrentAnswer/${summary.length}")),
            Container(
              decoration: const BoxDecoration(),
              child: Text(
                remarks,
                style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold, color: color),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            for (var i = 0; i < summary.length; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "* ${summary[i]['question']}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "User Answer   : ${summary[i]['user_answer']}",
                      style: TextStyle(
                          color: summary[i]['user_answer'] ==
                                  summary[i]['correct_answer']
                              ? Colors.green
                              : Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      summary[i]['user_answer'] == summary[i]['correct_answer']
                          ? " "
                          : "Correct Answer: ${summary[i]['correct_answer']}",
                      style: TextStyle(
                          color: summary[i]['user_answer'] ==
                                  summary[i]['correct_answer']
                              ? Colors.white
                              : Colors.purple),
                    )
                  ],
                ),
              ),
            OutlinedButton(
                onPressed: () {
                  onAction('start');
                },
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text('Restart'))
          ],
        ),
      ),
    );
  }
}

import 'package:json_bridge/json_bridge.dart';

class QuizQuestion {
  QuizQuestion(this.questions, this.answers);

  final String questions;
  final List<String> answers;

  List<String> getRandomAnswers() {
    final randomAnswers = List.of(answers);
    randomAnswers.shuffle();
    return randomAnswers;
  }

  static Future<List<dynamic>> loadQuestions() async {

    JSONBridge jsonBridge = JSONBridge()
      ..init(fileName: 'assets/questions.json');

    Map<String, dynamic> questionMap = jsonBridge.read();

    List<QuizQuestion> questions = convertMapToList(questionMap);

    return questions;

  }

  static List<QuizQuestion> convertMapToList(Map<String, dynamic> myMap) {
    return myMap.entries.map((entry) {
      return QuizQuestion(entry.key, entry.value);
    }).toList();
  }
}


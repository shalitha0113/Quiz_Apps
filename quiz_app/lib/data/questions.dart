

import 'package:quiz_app/models/quiz_question.dart';

List<QuizQuestion> questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets', // Correct Answer
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestion('How are Flutter UIs built?', [
    'By combining widgets in code', // Correct Answer
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes', // Correct Answer
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget', // Correct Answer
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated', // Correct Answer
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()', // Correct Answer
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
  QuizQuestion(
    'In Flutter, what is the purpose of the "pubspec.yaml" file?',
    [
      'Specifying project metadata and dependencies', // Correct Answer
      'Configuring app theme',
      'Managing project dependencies',
      'Defining app permissions',
    ],
  ),
  QuizQuestion(
    'In Flutter, what does the term "widget tree" refer to?',
    [
      'The hierarchy of nested widgets representing the app\'s UI', // Correct Answer
      ' A data structure for storing widget properties',
      'A visualization of widget relationships',
      'A hierarchical structure of UI elements',
    ],
  ),
  QuizQuestion(
    'What is the purpose of the "BuildContext" parameter in the "build" method of a Flutter widget?',
    [
      'Locating the position of the widget in the widget tree', // Correct Answer
      'Handling user input',
      'Accessing device location',
      'Defining widget styling',
    ],
  ),
  QuizQuestion(
    'What does the "pub" command in Flutter primarily manage?',
    [
      'Managing the navigation stack and transitioning between screens', // Correct Answer
      'Managing app permissions',
      'Controlling widget animations',
      'Handling HTTP requests for navigation purposes',
    ],
  ),
];
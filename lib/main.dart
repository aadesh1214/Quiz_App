import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final question = const [
    {
      'questionText': 'What\'s your Favorite Color?',
      'answers': [
        {'text': 'black', 'score': 1},
        {'text': 'white', 'score': 2},
        {'text': 'pink', 'score': 3},
        {'text': 'orange', 'score': 4}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'bear', 'score': 1},
        {'text': 'zebra', 'score': 2},
        {'text': 'people', 'score': 4},
        {'text': 'monkey', 'score': 4}
      ],
    },
    {
      'questionText': 'What\'s your passion?',
      'answers': [
        {'text': 'games', 'score': 1},
        {'text': 'coding', 'score': 2},
        {'text': 'movies', 'score': 3},
        {'text': 'songs', 'score': 4}
      ],
    },
  ];
  var _questionindex = 0;
  var _totalscore = 0;
  void resetquiz() {
    setState(() {
      _questionindex = 0;
      _totalscore = 0;
    });
  }

  void answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _questionindex = _questionindex + 1;
    });

    print(_questionindex);
    if (_questionindex < question.length) {
      print('we have more q\'s ');
    } else {
      print('we have completed q&a session');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionindex < question.length
            ? quiz(
                answerquestion: answerQuestion,
                questionindex: _questionindex,
                question: question,
              )
            : result(_totalscore, resetquiz),
      ),
    );
  }
}

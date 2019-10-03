import 'package:flutter/material.dart';
import 'package:hello_world/pages/quiz_app/components/quiz-content.dart';
import 'package:hello_world/pages/quiz_app/components/result.dart';
import 'package:hello_world/pages/quiz_app/data/questions-data.dart';

class QuizApp extends StatefulWidget {
  QuizApp({Key key}) : super(key: key);

  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba tu conocimiento'),
      ),
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                _questionIndex < mainMenuListData.length
                    ? mainMenuListData[_questionIndex]
                        .backgroundColor
                        .withAlpha(160)
                    : Colors.yellowAccent.withAlpha(160),
                _questionIndex < mainMenuListData.length
                    ? mainMenuListData[_questionIndex].backgroundColor
                    : Colors.yellowAccent
              ]),
        ),
        child: _questionIndex < mainMenuListData.length
            ? QuizContent(
                answerQuestionFunct: _answerQuestion,
                questionModel: mainMenuListData[_questionIndex],
              )
            : Result(),
      ),
    );
  }

  void _answerQuestion() {
    print(_questionIndex);
    if (_questionIndex < mainMenuListData.length) {
      print('We have more questions!');
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    } else {
      print('No more questions!');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:hello_world/pages/quiz_app/components/answer.dart';
import 'package:hello_world/pages/quiz_app/components/question.dart';
import 'package:hello_world/pages/quiz_app/data/questions-data.dart';
import 'package:hello_world/pages/quiz_app/model/answer_model.dart';

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
      body: Container(
        color: mainMenuListData[_questionIndex].backgroundColor,
        child: Column(
          children: <Widget>[
            Question(
              questionModel: mainMenuListData[_questionIndex],
            ),
            ...mainMenuListData[_questionIndex].answers.map((answerModel) {
              return Answer(
                  answerModel: answerModel,
                  onSelectedCallback: _answerQuestion);
            }).toList(),
          ],
        ),
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

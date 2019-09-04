import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/pages/quiz_app/model/answer_model.dart';

class Answer extends StatelessWidget {
  final AnswerModel answerModel;
  final Function onSelectedCallback;

  const Answer({Key key, this.onSelectedCallback, this.answerModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.blue[100],
        textColor: Colors.white,
        child: Text(answerModel.label),
        onPressed: onSelectedCallback,
      ),
    );
  }
}

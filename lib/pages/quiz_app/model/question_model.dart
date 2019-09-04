import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_world/pages/quiz_app/model/answer_model.dart';

class QuestionModel {
  final String label;
  final IconData iconData;
  final Color backgroundColor;
  final List<AnswerModel> answers;

  QuestionModel(this.backgroundColor, this.label, this.iconData, this.answers);
}

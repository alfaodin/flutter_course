import 'package:flutter/material.dart';
import 'package:hello_world/pages/quiz_app/model/answer_model.dart';
import 'package:hello_world/pages/quiz_app/model/question_model.dart';

List<QuestionModel> mainMenuListData = [
  QuestionModel(Colors.yellow[300], 'Question 2', Icons.border_all, [
    new AnswerModel('answer 1', 10),
    new AnswerModel('answer 2', 0),
    new AnswerModel('answer 3', 0),
    new AnswerModel('answer 4', 0),
    new AnswerModel('answer 5', 0),
    new AnswerModel('answer 6', 5),
  ]),
  QuestionModel(Colors.blue[200], 'Question 2', Icons.all_inclusive, [
    new AnswerModel('answer 1', 5),
    new AnswerModel('answer 2', 0),
    new AnswerModel('answer 3', 0),
    new AnswerModel('answer 4', 0),
  ]),
  QuestionModel(Colors.blueGrey, 'Question 3', Icons.border_color, [
    new AnswerModel('answer 1', 0),
    new AnswerModel('answer 2', 0),
    new AnswerModel('answer 3', 5),
    new AnswerModel('answer 4', 0),
    new AnswerModel('answer 5', 10),
  ]),
];

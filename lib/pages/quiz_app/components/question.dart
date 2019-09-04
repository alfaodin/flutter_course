import 'package:flutter/widgets.dart';
import 'package:hello_world/pages/quiz_app/model/question_model.dart';

class Question extends StatelessWidget {
  final QuestionModel questionModel;

  const Question({Key key, this.questionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
          questionModel.label,
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

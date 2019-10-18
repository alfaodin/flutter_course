import 'package:flutter/widgets.dart';
import 'package:hello_world/pages/quiz_app/components/answer.dart';
import 'package:hello_world/pages/quiz_app/components/question.dart';
import 'package:hello_world/pages/quiz_app/model/question_model.dart';

class QuizContent extends StatelessWidget {
  final QuestionModel questionModel;
  final Function answerQuestionFunct;

  const QuizContent({Key key, this.questionModel, this.answerQuestionFunct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(
          questionModel: questionModel,
        ),
        ...questionModel.answers.map((answerModel) {
          return Answer(
            answerModel: answerModel,
            onSelectedCallback: () => answerQuestionFunct(answerModel),
          );
        }).toList(),
      ],
    );
  }
}

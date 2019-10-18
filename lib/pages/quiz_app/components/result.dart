import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int userScore;
  final Function onReset;

  const Result({Key key, this.userScore, this.onReset}) : super(key: key);

  String get resultPhrase {
    var result = 'You did it!';

    if (userScore > 15) {
      result = 'You are awesome';
    } else {
      result = 'you must study';
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Your Score was: $userScore",
          ),
          Text(
            resultPhrase,
          ),
          Text(
            "There is no more questions",
          ),
          FlatButton(
            child: Text('Restart'),
            onPressed: onReset,
          )
        ],
      ),
    );
  }
}

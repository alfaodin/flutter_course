import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'delayed_reveal.dart';

class DominoAnimation extends StatelessWidget {
  const DominoAnimation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Domino Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DelayedReveal(
              delay: Duration(milliseconds: 150),
              child: Text('One', style: Theme.of(context).textTheme.display1),
            ),
            DelayedReveal(
              delay: Duration(milliseconds: 300),
              child: Text('Two', style: Theme.of(context).textTheme.display1),
            ),
            DelayedReveal(
              delay: Duration(milliseconds: 450),
              child: Text('Three', style: Theme.of(context).textTheme.display1),
            ),
            DelayedReveal(
              delay: Duration(milliseconds: 600),
              child: Text('Four', style: Theme.of(context).textTheme.display1),
            ),
            DelayedReveal(
              delay: Duration(milliseconds: 750),
              child: Text('Five', style: Theme.of(context).textTheme.display1),
            ),
            DelayedReveal(
              delay: Duration(milliseconds: 900),
              child: Text('Six', style: Theme.of(context).textTheme.display1),
            ),
          ],
        ),
      ),
    );
  }
}

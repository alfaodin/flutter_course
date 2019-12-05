import 'package:flutter/material.dart';

class CharBar extends StatelessWidget {
  final String label;
  final double expense;
  final double expensePercentage;

  const CharBar({this.label, this.expense, this.expensePercentage});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constrain) {
        return Column(
          children: <Widget>[
            Container(
              height: constrain.maxHeight * .15,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  '\$${expense.toStringAsFixed(0)}',
                ),
              ),
            ),
            SizedBox(
              height: constrain.maxHeight * .05,
            ),
            Container(
              height: constrain.maxHeight * .6,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 10,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: expensePercentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constrain.maxHeight * .05,
            ),
            Container(
              height: constrain.maxHeight * .15,
              child: FittedBox(
                child: Text(
                  label,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

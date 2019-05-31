import 'dart:math';

import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function _addProductFunc;
  const ProductControl(this._addProductFunc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        onPressed: () {
              int rndNum = Random(1).nextInt(10);
              
              _addProductFunc(
                  {'title': 'Advanced food $rndNum', 'image': 'assets/food.jpg'});
            },
        child: Text(
          'Add product'.toUpperCase(),
          style: TextStyle(
            color: Colors.white.withOpacity(.9),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

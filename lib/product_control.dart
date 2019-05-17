import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function _addProductFunc;
  const ProductControl(this._addProductFunc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        onPressed: () => {_addProductFunc('Sweets')},
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

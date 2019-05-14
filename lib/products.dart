import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> _products;

  Products(this._products) {
    print('Product constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('Product Builds');
    return Column(
      children: _products
          .map(
            (element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text(
                        element.toUpperCase(),
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}

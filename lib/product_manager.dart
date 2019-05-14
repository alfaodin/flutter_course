import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  final List<String> startintProduct;

  ProductManager(this.startintProduct);

  @override
  State<StatefulWidget> createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    super.initState();
    _products.addAll(widget.startintProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () => {
                  setState(
                    () => _products.add('Advanced food'),
                  )
                },
            child: Text(
              'Add product'.toUpperCase(),
              style: TextStyle(
                color: Colors.white.withOpacity(.9),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Products(_products),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> _products;
  final Function deleteProductFunc;

  Products(@required this._products, {this.deleteProductFunc}) {
    print('Product constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('Product Builds');
    return _products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductItem,
            itemCount: _products.length,
          )
        : Center(
            child: Text('There is no product in the list'),
          );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(_products[index]['image']),
          Text(
            _products[index]['title'].toUpperCase(),
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Details'),
                onPressed: () {
                  print('/product/$index');
                  Navigator.pushNamed<bool>(context, '/product/$index')
                      .then((bool value) {
                    print("a ver que mismo $value");
                    if (value) {
                      deleteProductFunc(index);
                    }
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

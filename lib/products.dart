import 'package:flutter/material.dart';
import 'package:hello_world/pages/product-detail.dart';

class Products extends StatelessWidget {
  final List<String> _products;

  Products(this._products) {
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
          Image.asset('assets/food.jpg'),
          Text(
            _products[index].toUpperCase(),
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ProductDetail(),
                      ),
                    ),
              )
            ],
          )
        ],
      ),
    );
  }
}

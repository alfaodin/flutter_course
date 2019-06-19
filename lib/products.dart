import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> _products;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text(
                  _products[index]['title'].toUpperCase(),
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(7.0)),
                child: Text(
                  '\$${_products[index]['price'].toString()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).accentColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 1.5,
              ),
              child: Text(
                'La Gasca, Quito - Ecuador',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
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
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Theme.of(context).accentColor,
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
              ),
            ],
          )
        ],
      ),
    );
  }
}

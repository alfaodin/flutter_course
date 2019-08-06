import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const ProductList({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset(
              products[index]['image'],
            ),
            title: Text(products[index]['title']),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}

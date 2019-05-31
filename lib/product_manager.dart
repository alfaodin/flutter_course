import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct});

  @override
  State<StatefulWidget> createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  final List<Map<String, String>> _products = [];

  @override
  void initState() {
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager state] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(Map<String, String> product) {
    setState(() => _products.add(product));
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buidExpandedContainer();
  }

  Widget _buidLiftUpWidget() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Container(height: 150, child: Products(_products)),
      ],
    );
  }

  Widget _buidExpandedContainer() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded(
          child: Products(_products, deleteProductFunc: _deleteProduct),
        ),
      ],
    );
  }

  Widget _buidGridTest() {
    return GridView.count(
      crossAxisCount: 3,
      scrollDirection: Axis.horizontal,
      children: List.generate(100, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headline,
          ),
        );
      }),
    );
  }
}

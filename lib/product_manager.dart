import 'package:flutter/material.dart';

import './product_control.dart';
import 'package:hello_world/pages/products/widgets/products/products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return _buidExpandedContainer(context);
  }

  Widget _buidExpandedContainer(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose an Item'),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.assessment),
                      title: Text('Manage Product'),
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/admin'),
                    ),
                  ),
                  Card(
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      title: Text('Music'),
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/music'),
                    ),
                  ),
                  Card(
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      title: Text('Staggered Animation'),
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/stagger'),
                    ),
                  ),
                  ListTile(
                    title: Text('Splash Page'),
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/splash'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
            ),
            onPressed: () {
              print('NAvegar a favoritos');
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10.0),
            child: ProductControl(addProduct),
          ),
          Expanded(
            child: Products(products, deleteProductFunc: deleteProduct),
          ),
        ],
      ),
    );
  }

  Widget _buidLiftUpWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        Container(height: 150, child: Products(products)),
      ],
    );
  }

  Widget _buidGridTest(BuildContext context) {
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

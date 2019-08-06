import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/pages/products/product_create.dart';
import 'package:hello_world/pages/products/product_list.dart';

class ProductAdmin extends StatelessWidget {
  final Function createProductCallback;
  final List<Map<String, dynamic>> products;

  const ProductAdmin(this.createProductCallback, this.products);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('BACK'),
                  RaisedButton(
                    child: Text('Return to menu'),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/'),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text('Manage Products'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  child: Text('Create Product'),
                ),
                Tab(
                  icon: Icon(Icons.list),
                  child: Text('My Products'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ProductCreate(
                createProductCallback: createProductCallback,
              ),
              ProductList(
                products: products,
              ),
            ],
          )),
    );
  }
}

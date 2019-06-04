import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/pages/products/product_create.dart';
import 'package:hello_world/pages/products/product_list.dart';
import 'package:hello_world/product_manager.dart';

class ProductAdmin extends StatelessWidget {
  const ProductAdmin({Key key}) : super(key: key);

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
                    onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (BuildContext contex) {
                            return ProductManager();
                          }),
                        ),
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
              ProductCreate(),
              ProductList(),
            ],
          )),
    );
  }
}

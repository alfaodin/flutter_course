import 'package:flutter/material.dart';

import 'package:hello_world/product_manager.dart';

main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        cardColor: Color.fromARGB(140, 255, 0, 0),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        body: ProductManager(['test']),
      ),
    );
  }
}

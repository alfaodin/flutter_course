import 'package:flutter/material.dart';
import 'package:hello_world/pages/meals/screens/categories_screen.dart';

class Meals extends StatefulWidget {
  Meals({Key key}) : super(key: key);

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('MEALS'),
    //   ),
    //   body: CategoriesScreen(),
    // );
    return MaterialApp(
      title: 'test',
      home: CategoriesScreen(),
    );
  }
}

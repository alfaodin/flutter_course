import 'package:flutter/material.dart';

import 'package:hello_world/pages/meals/screens/categories_screen.dart';
import 'package:hello_world/pages/meals/screens/meals_detail_screen.dart';
import 'package:hello_world/pages/meals/screens/category_meals_screen.dart';

class Meals extends StatefulWidget {
  Meals({Key key}) : super(key: key);

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      home: CategoriesScreen(),
      routes: {
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => CategoriesScreen()),
    );
  }
}

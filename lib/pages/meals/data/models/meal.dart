import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final String title;
  final bool isVegan;
  final int duration;
  final String imageUrl;
  final bool isGlutenFree;
  final bool isVegetarian;
  final bool isLactoseFree;
  final List<String> steps;
  final Complexity complexity;
  final List<String> categories;
  final List<String> ingredients;
  final Affordability affordability;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.imageUrl,
    @required this.duration,
    @required this.ingredients,
    @required this.steps,
    @required this.isGlutenFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.isLactoseFree,
  });
}

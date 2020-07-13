import 'package:flutter/material.dart';
import 'package:hello_world/pages/meals/components/meal_item.dart';
import '../data/dummy-data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryid = routesArgs['id'];
    final categoryTitle = routesArgs['title'];

    final mealsByCategory = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryid))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text('$categoryTitle'),
        ),
        body: ListView.builder(
          itemCount: mealsByCategory.length,
          itemBuilder: (_, index) {
            return Container(
              child: MealItem(
                meal: mealsByCategory[index],
              ),
            );
          },
        ));
  }
}

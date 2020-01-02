import 'package:flutter/material.dart';

import 'category_item.dart';
import '../data/dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Deli meals',
        ),
      ),
      body: buildMealCategories(),
    );
  }

  Padding buildMealCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: GridView(
        children: DUMMY_CATEGORIES
            .map((cat) => CategoryItem(cat.title, cat.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}

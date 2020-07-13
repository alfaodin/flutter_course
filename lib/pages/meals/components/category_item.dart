import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_world/pages/meals/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.title, this.color, this.id);

  @override
  Widget build(BuildContext context) {
    final TextStyle display1 = Theme.of(context).textTheme.subtitle1;
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        '/category-meals',
        arguments: {
          'id': id,
          'title': title,
        },
      ),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: GoogleFonts.pacifico(textStyle: display1),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

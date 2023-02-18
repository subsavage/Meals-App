import 'package:flutter/material.dart';
import '/screens/category_meals_screen.dart';

class categoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  categoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(categorymealsscreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.grey,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(title),
        decoration: BoxDecoration(
          color: color,
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

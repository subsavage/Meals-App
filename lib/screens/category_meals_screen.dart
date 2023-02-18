import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '/dummy-data.dart';
import '/models/meal.dart';

class categorymealsscreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  categorymealsscreen(this.availableMeals);

  @override
  State<categorymealsscreen> createState() => _categorymealsscreenState();
}

class _categorymealsscreenState extends State<categorymealsscreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;
  // final categoryId;
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void initState() {
    super.initState();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageURL: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}

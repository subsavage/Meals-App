import 'package:flutter/material.dart';
import '../dummy-data.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';
import '/screens/meal_details_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegatarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      // theme: ThemeData(
      //   primarySwatch: Colors.pink,
      //   accentColor: Colors.amber,
      //   canvasColor: Color.fromRGBO(255, 254, 229, 1),
      //   fontFamily: 'Raleway',
      // ),
      // home: Categories(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => tabsScreen(),
        categorymealsscreen.routeName: (ctx) =>
            categorymealsscreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        filtersScreen.routeName: (ctx) => filtersScreen(_filters, _setFilters),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => categorymealsscreen(_availableMeals));
      },
    );
  }
}

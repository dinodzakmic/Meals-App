import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/filters_screen.dart';
import './models/filters.dart';
import './dummy-data.dart';
import './models/meal.dart';

//TODO Add App icon and some styling stuff

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters _filters = Filters();
  List<MealClient> _availableMeals = DUMMY_MEALS.map((meal) {
    return MealClient(meal: meal);
  }).toList();
  List<MealClient> _favoriteMeals = [];

  _saveAndUpdateFilters(Filters newFilters) {
    _filters = newFilters;

    _availableMeals = DUMMY_MEALS
        .map((meal) {
          return MealClient(meal: meal);
        })
        .toList()
        .where((meal) {
          if (meal.isGlutenFree && _filters.showGlutenFree) return true;

          if (meal.isLactoseFree && _filters.showLactoseFree) return true;

          if (meal.isVegan && _filters.showVegan) return true;

          if (meal.isVegetarian && _filters.showVegetarian) return true;

          if (_filters.checkIfShowAll()) return true;

          return false;
        })
        .toList();
  }

  _toggleFavorite(String id) {
    final selectedMeal = _availableMeals.firstWhere((meal) => meal.id == id);
    final alreadyFavorite = _favoriteMeals.contains(selectedMeal);

    if (alreadyFavorite) {
      setState(() {
        selectedMeal.isFavorite = false;
        _favoriteMeals.remove(selectedMeal);
      });
    } else {
      setState(() {
        selectedMeal.isFavorite = true;
        _favoriteMeals.add(selectedMeal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Delischz',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        routes: {
          TabsScreen.routeName: (context) => TabsScreen(
                favoriteMeals: _favoriteMeals,
              ),
          CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
                availableMeals: _availableMeals,
              ),
          MealDetailsScreen.routeName: (context) => MealDetailsScreen(
                availableMeals: _availableMeals,
                makeFavoriteMeal: _toggleFavorite,
              ),
          FiltersScreen.routeName: (context) => FiltersScreen(
                filters: _filters,
                saveFilters: _saveAndUpdateFilters,
              ),
        });
  }
}

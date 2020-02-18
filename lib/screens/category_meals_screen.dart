import 'package:flutter/material.dart';

import './../widgets/meal_item.dart';
import './../dummy-data.dart';
import './../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  bool _initialCategoriesDisplay = true;
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    if (_initialCategoriesDisplay) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = DUMMY_MEALS
          .where((meal) => meal.categories.contains(categoryId))
          .toList();

      _initialCategoriesDisplay = false;
    }

    super.didChangeDependencies();
  }

  removeItem(String id) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            var selectedMeal = displayedMeals[index];

            return MealItem(
              key: ValueKey(index),
              id: selectedMeal.id,
              title: selectedMeal.title,
              imageUrl: selectedMeal.imageUrl,
              duration: selectedMeal.duration,
              complexity: selectedMeal.complexity,
              affordability: selectedMeal.affordability,
              removeItem: removeItem,
            );
          },
          itemCount: displayedMeals.length ?? 0,
        ),
      ),
    );
  }
}

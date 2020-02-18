import 'package:flutter/material.dart';

import './../widgets/meal_item.dart';
import './../dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  removeItem(String id) {
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            var selectedMeal = categoryMeals[index];

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
          itemCount: categoryMeals.length ?? 0,
        ),
      ),
    );
  }
}

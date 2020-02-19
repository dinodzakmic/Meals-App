import 'package:flutter/material.dart';

import './../widgets/meal_item.dart';
import './../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<MealClient> favoriteMeals;
  const FavoritesScreen({this.favoriteMeals});

  //TODO If the user opens the MealDetailsScreen from FavoritesScreen and unfavorite the meal, it is not updated when he goes back to FavoritesScreen

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          var selectedMeal = favoriteMeals[index];

          return MealItem(
            key: ValueKey(index),
            id: selectedMeal.id,
            title: selectedMeal.title,
            imageUrl: selectedMeal.imageUrl,
            duration: selectedMeal.duration,
            complexity: selectedMeal.complexity,
            affordability: selectedMeal.affordability,
          );
        },
        itemCount: favoriteMeals.length ?? 0,
      ),
    );
  }
}

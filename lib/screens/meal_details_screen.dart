import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_details_section.dart';
import 'package:meals_app/widgets/meal_details_title.dart';

import './../dummy-data.dart';
import './../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  String getComplexityText(Complexity complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String getAffordabilityText(Affordability affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String mealId = routeArgs['id'];

    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    final int duration = selectedMeal.duration;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Image.network(
              selectedMeal.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          MealDetailsTitle(
            title: "Basic Info",
            icon: Icon(Icons.info),
          ),
          MealDetailsSection(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 6),
                    Text('$duration min')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 6),
                    Text(getComplexityText(selectedMeal.complexity))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 6),
                    Text(getAffordabilityText(selectedMeal.affordability))
                  ],
                ),
              ],
            ),
            color: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          MealDetailsTitle(
            title: "Ingredients",
            icon: Icon(Icons.apps),
          ),
          MealDetailsSection(
            color: Colors.white,
            child: Container(
              height: 120,
              child: ListView.separated(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  var ingredient = selectedMeal.ingredients[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.extension,
                          size: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          ingredient,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black54,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

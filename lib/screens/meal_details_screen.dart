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
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  selectedMeal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
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
              ),
              Column(
                children: <Widget>[
                  MealDetailsTitle(
                    title: "Ingredients",
                    icon: Icon(Icons.apps),
                  ),
                  MealDetailsSection(
                    color: Colors.white54,
                    child: Container(
                      height: 200,
                      child: Scrollbar(
                        child: ListView.separated(
                          itemCount: selectedMeal.ingredients.length,
                          itemBuilder: (ctx, index) {
                            var ingredient = selectedMeal.ingredients[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(context).accentColor,
                                foregroundColor:
                                    Theme.of(context).textTheme.body1.color,
                                child: Icon(
                                  Icons.extension,
                                  size: 20,
                                ),
                              ),
                              title: Text(
                                ingredient,
                                softWrap: true,
                              ),
                              dense: true,
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MealDetailsTitle(
                    title: "Steps",
                    icon: Icon(Icons.format_list_numbered_rtl),
                  ),
                  MealDetailsSection(
                    color: Colors.white54,
                    child: Container(
                      height: 200,
                      child: Scrollbar(
                        child: ListView.separated(
                          itemCount: selectedMeal.steps.length,
                          itemBuilder: (ctx, index) {
                            var step = selectedMeal.steps[index];
                            var stepNumber = index + 1;
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(context).accentColor,
                                foregroundColor:
                                    Theme.of(context).textTheme.body1.color,
                                child: Text(
                                  "#$stepNumber",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              title: Text(
                                step,
                                softWrap: true,
                              ),
                              dense: true,
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

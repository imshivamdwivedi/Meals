import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '../widget/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favMeals;

  FavouritesScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text('Currently no favroites meals exists'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favMeals[index].id,
            title: favMeals[index].title,
            imageUrl: favMeals[index].imageUrl,
            affordability: favMeals[index].affordability,
            complexity: favMeals[index].complexity,
            duration: favMeals[index].duration,
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}

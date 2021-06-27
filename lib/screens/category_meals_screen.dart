import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> meals;

  CategoryMealsScreen(this.meals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayMeals;
  var loadedInItData = false;
  @override
  @override
  void didChangeDependencies() {
    if (!loadedInItData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      displayMeals = widget.meals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      loadedInItData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      print(mealId);
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeals[index].id,
              title: displayMeals[index].title,
              imageUrl: displayMeals[index].imageUrl,
              affordability: displayMeals[index].affordability,
              complexity: displayMeals[index].complexity,
              duration: displayMeals[index].duration,
            );
          },
          itemCount: displayMeals.length,
        ));
  }
}

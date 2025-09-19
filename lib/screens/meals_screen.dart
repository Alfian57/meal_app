import 'package:flutter/material.dart';
import 'package:myapp/models/meal.dart';
import 'package:myapp/screens/meal_detail_screen.dart';
import 'package:myapp/widgets/meal_list_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => MealDetailScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Uh oh ... nothing here!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Try selecting a different category!",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealListItem(
          meal: meals[index],
          onSelectMeal: () {
            _selectMeal(context, meals[index]);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}

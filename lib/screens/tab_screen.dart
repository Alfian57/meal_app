import 'package:flutter/material.dart';
import 'package:myapp/models/meal.dart';
import 'package:myapp/screens/categories_screen.dart';
import 'package:myapp/screens/meals_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _activeIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage("Meal is no longer a favorite");
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage("Marked as a favorite");
      });
    }
  }

  void _selectActiveIndex(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScren(
      onToogleFavorite: _toggleMealFavoriteStatus,
    );
    String pageTitle = "Categories";

    if (_activeIndex == 1) {
      activePage = MealScreen(
        meals: _favoriteMeals,
        onToogleFavorite: _toggleMealFavoriteStatus,
      );
      pageTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectActiveIndex,
        currentIndex: _activeIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}

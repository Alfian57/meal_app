import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/providers/favorites_provider.dart';
import 'package:myapp/screens/categories_screen.dart';
import 'package:myapp/screens/filter_screen.dart';
import 'package:myapp/screens/meals_screen.dart';
import 'package:myapp/widgets/main_drawer.dart';
import 'package:myapp/providers/filters_provider.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _activeIndex = 0;

  void _selectActiveIndex(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => const FilterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMelasProvider);

    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    String pageTitle = "Categories";

    if (_activeIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealrovider);
      activePage = MealScreen(meals: favoriteMeals);
      pageTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      drawer: MainDrawer(onSelect: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectActiveIndex,
        currentIndex: _activeIndex,
        items: const [
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
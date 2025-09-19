import 'package:myapp/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealNotifier extends Notifier<List<Meal>> {
  @override
  List<Meal> build() => [];

  

  bool toggleMealFavoriteStatus(Meal meal) {
    final isMealFavorite = state.contains(meal);

    if (isMealFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealrovider = NotifierProvider<FavoriteMealNotifier, List<Meal>>(
  FavoriteMealNotifier.new,
);

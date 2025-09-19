import 'package:flutter/material.dart';
import 'package:myapp/providers/filters_provider.dart';
import 'package:myapp/widgets/filter_switch_item.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filters")),
      body: Column(
        children: [
          FilterSwitchItem(
            title: "Gluten-free",
            subtitle: "Only include gluten-free meals.",
            filterType: Filter.glutenFree,
          ),
          FilterSwitchItem(
            title: "Lactose-free",
            subtitle: "Only include lactoce-free meals.",
            filterType: Filter.lactoseFree,
          ),
          FilterSwitchItem(
            title: "Vegatarian",
            subtitle: "Only include vegetarian meals.",
            filterType: Filter.vegetarian,
          ),
          FilterSwitchItem(
            title: "Vegan",
            subtitle: "Only include vegan meals.",
            filterType: Filter.vegan,
          ),
        ],
      ),
    );
  }
}

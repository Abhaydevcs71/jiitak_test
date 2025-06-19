// lib/widgets/category_expansion_tile.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiitak_test/viewmodel/home_view_model.dart';

class CategoryExpansionTile extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const CategoryExpansionTile({super.key, required this.homeViewModel});

  final List<String> _categories = const [
    "business",
    "crime",
    "domestic",
    "education",
    "entertainment",
    "environment",
    "food",
    "health",
    "lifestyle",
    "other",
    "politics",
    "science",
    "sports",
    "technology",
    "top",
    "tourism",
    "world"
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text("Category"),
      children: [
        Obx(() {
          final selected = homeViewModel.categoryList;

          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _categories.map((category) {
              final isSelected = selected.contains(category);
              return FilterChip(
                label: Text(category),
                selected: isSelected,
                selectedColor: Colors.blue.shade300,
                checkmarkColor: Colors.white,
                onSelected: (bool selectedNow) {
                  if (selectedNow) {
                    if (selected.length < 5) {
                      //if the length of selected categories is lessthan 5 then add selected category to the list and join it using "OR" for api calling
                      homeViewModel.categoryList.add(category);
                      homeViewModel.joinedCategory.value =
                          homeViewModel.categoryList.join(" OR ");
                    } else {
                      //if the length of selected categories is morethan 5 then remove the selected category from 0 th position add the newly selected category to the list and Join it using " OR "
                      homeViewModel.categoryList.removeAt(0);
                      homeViewModel.categoryList.add(category);
                      homeViewModel.joinedCategory.value =
                          homeViewModel.categoryList.join(" OR ");
                      debugPrint(
                          "Category List : ${homeViewModel.categoryList}");
                      debugPrint(
                          "Joined Category List : ${homeViewModel.joinedCategory}");
                    }
                  } else {
                    //if user clicked a already selected category it remove from the list
                    homeViewModel.categoryList.remove(category);
                    homeViewModel.joinedCategory.value =
                        homeViewModel.categoryList.join(" OR ");
                    debugPrint(
                        "Joined Category List : ${homeViewModel.joinedCategory}");
                  }
                },
              );
            }).toList(),
          );
        }),
        const SizedBox(height: 10),
      ],
    );
  }
}

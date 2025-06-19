// lib/widgets/unit_expansion_tile.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiitak_test/viewmodel/home_view_model.dart';

class UnitExpansionTile extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const UnitExpansionTile({super.key, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text("Change Unit"),
      children: [
        Obx(() {
          final selected = homeViewModel.unitsValue.value;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              children: [
                _buildUnitButton(
                  //passing value "metric" to the weather Api for get temperature unit in °C
                  label: "°C",
                  value: "metric",
                  selected: selected == "metric",
                  onPressed: () async {
                    homeViewModel.unitsValue.value = "metric";
                    await homeViewModel.fetchWeather();
                    await homeViewModel.fetchForeCast();
                  },
                ),
                const SizedBox(width: 10),
                _buildUnitButton(
                  //passing value "imperial" to the weather Api for get temperature unit in °F
                  label: "°F",
                  value: "imperial",
                  selected: selected == "imperial",
                  onPressed: () async {
                    homeViewModel.unitsValue.value = "imperial";
                    await homeViewModel.fetchWeather();
                    await homeViewModel.fetchForeCast();
                  },
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildUnitButton({
    required String label,
    required String value,
    required bool selected,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? Colors.blue : Colors.grey[300],
          foregroundColor: selected ? Colors.white : Colors.black,
        ),
        child: Text(label),
      ),
    );
  }
}

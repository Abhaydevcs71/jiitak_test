import 'package:flutter/material.dart';
import 'package:jiitak_test/viewmodel/home_view_model.dart';

class ForecastListBox extends StatelessWidget {
  final String week;
  final String date;
  final String temp;
  final String mainWeather;
  final HomeViewModel homeViewModel;

  const ForecastListBox({
    super.key,
    required this.week,
    required this.date,
    required this.mainWeather,
    required this.temp,
    required this.homeViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 80,
      padding:
          EdgeInsets.symmetric(vertical: 10), // Add some top/bottom padding
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: const Color.fromARGB(255, 207, 169, 137),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ✅ Fix: Shrinks Column height
        mainAxisAlignment:
            MainAxisAlignment.center, // Optional: Center contents
        children: [
          Text(week.substring(0, 3),
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(
            date,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          Text(
            homeViewModel.unitsValue.value == "metric" ? "$temp°C" : "$temp°F",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Text(mainWeather,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
        ],
      ),
    );
  }
}
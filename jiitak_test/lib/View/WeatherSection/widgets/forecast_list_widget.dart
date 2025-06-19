import 'package:flutter/material.dart';
import 'package:jiitak_test/Model/forecast_model.dart';
import 'package:jiitak_test/View/WeatherSection/widgets/forecast_list_box.dart';
import 'package:jiitak_test/viewmodel/common_view_model.dart';
import 'package:jiitak_test/viewmodel/home_view_model.dart';

class ForecastListWidget extends StatelessWidget {
  final ForecastData forecastData;
  final HomeViewModel homeViewModel;
  const ForecastListWidget(
      {super.key, required this.forecastData, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    final CommonViewModel commonViewModel = CommonViewModel();

    final dailyForecasts = forecastData.list.where((item) {
      //  Get only one forecast per day (preferably at 12:00:00)
      return item.dtTxt.hour == 12;
    }).toList();

    return ListView.builder(
      itemCount: dailyForecasts.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final forecast = dailyForecasts[index];
        return ForecastListBox(
          week: commonViewModel.findDayOfWeek(forecast.dt),
          date: commonViewModel.formatUnixTimestamp(forecast.dt),
          temp: forecast.temp.toStringAsFixed(0),
          mainWeather: forecast.mainWeather,
          homeViewModel: homeViewModel,
        );
      },
    );
  }
}

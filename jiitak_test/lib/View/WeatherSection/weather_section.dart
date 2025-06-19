import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiitak_test/View/NewsSection/widgets/news_error_widget.dart';
import 'package:jiitak_test/View/WeatherSection/loaction_denied_widget.dart';
import 'package:jiitak_test/View/WeatherSection/widgets/forecast_list_widget.dart';
import 'package:jiitak_test/viewmodel/common_view_model.dart';
import 'package:jiitak_test/viewmodel/home_view_model.dart';

class WeatherSection extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const WeatherSection({
    super.key,
    required this.homeViewModel,
  });

  @override
  Widget build(BuildContext context) {
    final CommonViewModel commonViewModel = CommonViewModel();
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: MediaQuery.of(context).size.height * 0.31,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white24,
            )),
        child: Obx(
          () {
            final weatherData = homeViewModel.weatherData.value;
            final forecastData = homeViewModel.forecastData.value;
            if (homeViewModel.isWeatherLoading.value == true) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              );
            }
             else if (homeViewModel.latitude.value == 0.0) {
              //if latitude == 0.0 then no location display Denied Widget
              return LoactionDeniedWidget(
                onPressedRetry: () async {
                  await homeViewModel.fetchCurrentLocation();
                },
              );
            }
            else if (weatherData == null) {
              //weather Data == null then display error widget
              return NewsErrorWidget(
                onPressedRetry: () async {
                  await homeViewModel.fetchCurrentLocation();
                },
              );
            } else {
              return Column(
                children: [
                  Row(
                    children: [
                      Text(commonViewModel.formatSimpleDate(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "📍 ${weatherData.name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              homeViewModel.unitsValue.value == "metric"
                                  ? "${weatherData.main.temp}°C"
                                  : "${weatherData.main.temp}°F",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              weatherData.weather[0].main,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.water_drop_rounded,
                                  color: Colors.blue[200],
                                ),
                                Text(
                                  "${weatherData.main.humidity}%",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.air_rounded,
                                  color: Colors.white,
                                ),
                                Text(
                                  homeViewModel.unitsValue.value == "metric"
                                      ? "${weatherData.wind.speed} m/s"
                                      : "${weatherData.wind.speed} m/h",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 2,
                      child: forecastData != null
                          ? ForecastListWidget(
                              forecastData: forecastData,
                              homeViewModel: homeViewModel,
                            )
                          : SizedBox()),
                ],
              );
            }
          },
        ));
  }
}

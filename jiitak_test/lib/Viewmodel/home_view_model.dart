import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiitak_test/Model/forecast_model.dart';
import 'package:jiitak_test/Model/news_model.dart';
import 'package:jiitak_test/Model/weather_model.dart';
import 'package:jiitak_test/services/forecast_service.dart';
import 'package:jiitak_test/services/news_service.dart';
import 'package:jiitak_test/services/weather_service.dart';
import 'package:jiitak_test/viewmodel/common_view_model.dart';

class HomeViewModel extends GetxController {
  final BuildContext context;
  HomeViewModel({
    required this.context,
  });
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var isWeatherLoading =
      false.obs; //to show loading indiacator if fetching weather
  var isNewsLoading = false.obs; //to show loading indiacator if fetching news
  var temperature = 0.obs; //to display the news according to the temperature
  var keywordsValue = "depressing OR tragedy".obs;

  var unitsValue = "metric"
      .obs; //to change the units of values (°c/°F).* keyword to call weather api
  var categoryList =
      [].obs; //category list for user selected category to fetch news
  var joinedCategory = ''
      .obs; //join the elements in category list using " OR ".keyword to call News Api

  final Rxn<WeatherData> weatherData = Rxn<WeatherData>();
  final Rxn<ForecastData> forecastData = Rxn<ForecastData>();
  final Rxn<NewsData> newsData = Rxn<NewsData>();

  final WeatherService _weatherService = WeatherService();
  final ForecastService _forecastService = ForecastService();
  final NewsService _newsService = NewsService();

  final CommonViewModel _commonViewModel = CommonViewModel();

  @override
  void onInit() async {
    await fetchCurrentLocation();
    await fetchNews();
    super.onInit();
  }

  Future<void> fetchCurrentLocation() async {
    //fetch User Current Location
    isWeatherLoading.value = true;
    isNewsLoading.value = true;
    debugPrint("getCurrent Location Called");
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude.value = cPosition.latitude;
    longitude.value = cPosition.longitude;
    await fetchWeather();
    await fetchForeCast();
    isWeatherLoading.value = false;
    isNewsLoading.value = false;
  }

  Future<void> fetchWeather() async {
    //fetch Weather from Api
    isWeatherLoading.value = true;
    final response = await _weatherService.fetchCurrentWeather(
        lat: latitude.value, lon: longitude.value, units: unitsValue.value);
    if (response != null) {
      weatherData.value = WeatherData.fromJson(response);
      var temp = weatherData.value?.main.temp ?? 0.0;
      temperature.value = temp.toInt();
      debugPrint(
          "temperature value : ${temperature.value} unit: ${unitsValue.value}");

      isWeatherLoading.value = false;
    } else {
      weatherData.value = null;
      isWeatherLoading.value = false;
    }
  }

  Future<void> fetchForeCast() async {
    //fetch Forecast from API
    isWeatherLoading.value = true;
    final response = await _forecastService.fetchForeCastWeather(
        units: unitsValue.value,
        lat: latitude.value,
        lng: longitude.value,
        context: context);
    if (response != null) {
      forecastData.value = ForecastData.fromJson(response);
      isWeatherLoading.value = false;
    } else {
      forecastData.value = null;
      isWeatherLoading.value = false;
    }
  }

  Future<void> fetchNews() async {
    //Fetch news fro API
    isNewsLoading.value = true;
    keywordsValue.value = categoryList.isEmpty
        ? _commonViewModel.setKeyworsWithTemperature(
            unit: unitsValue.value, temp: temperature.value)
        : joinedCategory.value;
    debugPrint("Fetch news called");
    final response =
        await _newsService.fetchNewsApi(keywords: keywordsValue.value);
    if (response != null) {
      newsData.value = NewsData.fromJson(response);
      isNewsLoading.value = false;
    } else {
      isNewsLoading.value = false;
      newsData.value = null;
    }
  }
}

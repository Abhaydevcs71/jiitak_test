
//only use need data
import 'dart:convert';

ForecastData forecastDataFromJson(String str) =>
    ForecastData.fromJson(json.decode(str));

class ForecastData {
  List<ForecastItem> list;

  ForecastData({required this.list});

  factory ForecastData.fromJson(Map<String, dynamic> json) => ForecastData(
        list: List<ForecastItem>.from(
            json["list"].map((x) => ForecastItem.fromJson(x))),
      );
}

class ForecastItem {
  int dt;//timestamp
  DateTime dtTxt;//for sort every day 12:00 time
  double temp; //average temperature
  String mainWeather; //weather like clear,clouds,rain,sunny..etc

  ForecastItem({
    required this.dt,
    required this.dtTxt,
    required this.temp,
    required this.mainWeather,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) => ForecastItem(
        dt: json["dt"],
        dtTxt: DateTime.parse(json["dt_txt"]),
        temp: json["main"]["temp"]?.toDouble(),
        mainWeather: json["weather"][0]["main"],
      );
}

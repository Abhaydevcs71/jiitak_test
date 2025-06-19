import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String _apiKey = '07bba1e8f15ab270529f97f4a10d3b10'; // Your API key

  Future<Map<String, dynamic>?> fetchCurrentWeather({
    required double lat,
    required double lon,
    required String units,
  }) async {
    final String url =
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=$units&appid=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      debugPrint("response of Weather Api : ${response.body}");
      debugPrint("response of Weather Api statuscode : ${response.statusCode}");
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('API error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Exception during API call: $e');
      return null;
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForecastService {
  final String _apiKey = '07bba1e8f15ab270529f97f4a10d3b10';

  Future<Map<String, dynamic>?> fetchForeCastWeather({
    required String units,
    required double lat,
    required double lng,
    required BuildContext context,
  }) async {
    final String url =
        'http://api.openweathermap.org/data/2.5/forecast?id=524901&lat=$lat&lon=$lng&units=$units&appid=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint("response of forecast Data : ${response.body}");
        return json.decode(response.body);
      } else {
        print('API error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

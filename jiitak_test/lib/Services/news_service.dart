import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsService {
  final String _apiKey = 'c3e5cc0ea6c1426a9517ec11d58461fa'; // Your API key

  Future<Map<String, dynamic>?> fetchNewsApi({
    required String keywords,
  }) async {
    final String url =
        'https://newsapi.org/v2/everything?q=$keywords&apiKey=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));
        debugPrint("news api url : $url");
      
      if (response.statusCode == 200) {
        debugPrint("news api response : ${response.body}");
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

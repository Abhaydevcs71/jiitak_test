import 'package:flutter/material.dart';
import 'package:jiitak_test/View/init_location_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:jiitak_test/View/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitLocationScreen(), // Load this first
    );
  }
}

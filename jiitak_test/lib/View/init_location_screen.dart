import 'package:flutter/material.dart';
import 'package:jiitak_test/View/home_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class InitLocationScreen extends StatefulWidget {
  const InitLocationScreen({super.key});

  @override
  State<InitLocationScreen> createState() => _InitLocationScreenState();
}

class _InitLocationScreenState extends State<InitLocationScreen> {
  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      //if location granded navigate to the homeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else if (status.isPermanentlyDenied) {
      //if location denied for permenantly then open app settings for cahnge the permition
      openAppSettings();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission is required.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

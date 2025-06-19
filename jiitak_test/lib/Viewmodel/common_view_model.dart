import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonViewModel {


  String formatUnixTimestamp(int timestamp) {
    // format timmestamp to MM/dd format
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('MM/dd').format(date); // e.g., 06/18
  }

  String findDayOfWeek(int timestamp) {
    //format timestamp to get name of the day
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('EEEE').format(date); // e.g., Wednesday
  }

  String formatUtcToLocal(DateTime utcTimestamp) {
    //  to display date and time used in the news published date and time
    DateTime localDateTime = utcTimestamp.toLocal();

    String formatted = DateFormat('dd/MM/yyyy - hh:mm a').format(localDateTime);
    return formatted;
  }

  String formatSimpleDate() {
    //to display the simple date
    DateTime dateTime = DateTime.now();
    DateTime localDateTime = dateTime.toLocal();

    String formatted = DateFormat('dd/MM/yyyy').format(localDateTime);
    return formatted;
  }

  String setKeyworsWithTemperature({required String unit, required int temp}) {
    // to filter the news according to the temperature of the weather
    if (unit == "metric") {
      //if the temperature in °C
      if (temp > 30) {
        //if temperature is hot then display news relate to fear and danger
        debugPrint("Weather is hot");
        return "fear OR danger";
      } else if (temp < 30 && temp > 8) {
        //if temperature is warm then display news relate to winning, positivity and happiness
        return "winning OR positivity OR happiness";
      } else {
        //if temperature is cold then display news relate to depressing and tragedy
        return "depressing OR tragedy";
      }
    } else if (unit == "imperial") {
      //if the temperature in °F
      if (temp > 86) {
        //if temperature is hot then display news relate to fear and danger
        debugPrint("Weather is hot");
        return "fear OR danger";
      } else if (temp < 86 && temp > 46) {
        //if temperature is warm then display news relate to winning, positivity and happiness
        return "winning OR positivity OR happiness";
      } else {
        //if temperature is cold then display news relate to depressing and tragedy
        return "depressing OR tragedy";
      }
    } else {
      //if the temperature in kelvin.Not used in this project
      if (temp > 303) {
        debugPrint("Weather is hot");
        return "fear OR danger";
      } else if (temp < 303 && temp > 281) {
        return "winning OR positivity OR happiness";
      } else {
        return "depressing OR tragedy";
      }
    }
  }


//show snackbar at bottom of screen
  void showBottomSnackbar(
      {required BuildContext context,
      required String message,
      Color? backgroundColor,
      Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? Duration(seconds: 2),
        backgroundColor: backgroundColor ?? Colors.black,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

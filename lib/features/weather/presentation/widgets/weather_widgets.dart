import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherWidgets {
  static AssetImage getBackGroundImage() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk').format(now);
    if (6 > int.parse(formattedDate)) {
      return AssetImage('assets/images/night_bg.jpg');
    } else if (18 > int.parse(formattedDate)) {
      return AssetImage('assets/images/day_bg.jpg');
    } else {
      return AssetImage('assets/images/night_bg.jpg');
    }
  }

  static Image setIconForMain(String description, double height) {
    if (description == "clear sky") {
      return Image(image: AssetImage('assets/images/sun.png'), height: height);
    } else if (description == "few clouds") {
      return Image(
        image: AssetImage('assets/images/partly-cloudy-day.png'),
        height: height,
      );
    } else if (description.contains("clouds")) {
      return Image(image: AssetImage('assets/images/clouds.png'), height: height);
    } else if (description.contains("thunderstorm")) {
      return Image(image: AssetImage('assets/images/storm.png'), height: height);
    } else if (description.contains("drizzle")) {
      return Image(image: AssetImage('assets/images/rain-cloud.png'), height: height);
    } else if (description.contains("rain")) {
      return Image(image: AssetImage('assets/images/heavy-rain.png'), height: height);
    } else if (description.contains("snow")) {
      return Image(image: AssetImage('assets/images/snow.png'), height: height);
    } else {
      return Image(image: AssetImage('assets/images/windy.png'), height: height);
    }
  }
}

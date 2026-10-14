import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/config/di/injection.dart';
import 'package:weather/core/weather_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  runApp(WeatherApp());
}

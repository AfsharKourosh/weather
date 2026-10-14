import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather/features/weather/presentation/screens/counter_screen.dart';
import 'package:weather/features/weather/presentation/screens/curent_weather.dart';

class WeatherApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return MaterialApp(
        debugShowCheckedModeBanner: kDebugMode,
        home: const CurentWeather(),
      );
    }

    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: kDebugMode,
        scrollBehavior: CupertinoScrollBehavior(),
        home: CounterScreen(),
      );
    }
    return const SizedBox.shrink();
  }
}

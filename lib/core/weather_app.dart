import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/components/app_toast.dart';
import 'package:weather/features/weather/date/models/weather_req_model.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/screens/counter_screen.dart';
import 'package:weather/features/weather/presentation/screens/curent_weather.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(
      GetCurentWeather(
        WeatherReqModel(cityName: 'Tehran', measure: 'metric'),
      ),
    );
    if (Platform.isAndroid) {
      return MaterialApp(
        scaffoldMessengerKey: AppToast.messengerKey,
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

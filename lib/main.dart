import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/di/injection.dart';
import 'package:weather/core/weather_app.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    BlocProvider(create: (context) => sl<WeatherBloc>(), child: WeatherApp()),
  );
}

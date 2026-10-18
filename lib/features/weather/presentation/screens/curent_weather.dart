import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_status.dart';

class CurentWeather extends StatelessWidget {
  const CurentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.curentWeatherStatus is CurentWeatherLoading) {
            return Center(child: Text('loading'));
          }

          if (state.curentWeatherStatus is CurentWeatherCompleted) {
            return Center(child: Text('completed'));
          }
          if (state.curentWeatherStatus is Error) {
            return Center(child: Text('error'));
          }

          return const SizedBox.shrink();
        },
      ),
      appBar: AppBar(),
    );
  }
}

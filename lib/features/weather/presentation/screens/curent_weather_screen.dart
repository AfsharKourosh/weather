import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/components/custom_loading.dart';
import 'package:weather/features/weather/date/models/weather_req_model.dart';
import 'package:weather/features/weather/domain/entitys/weather_res_entity.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_status.dart';
import 'package:weather/features/weather/presentation/widgets/max_min_temp.dart';
import 'package:weather/features/weather/presentation/widgets/weather_widgets.dart';

class CurentWeatherScreen extends StatelessWidget {
  const CurentWeatherScreen({super.key});

  // final PageController pageController;

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(
      GetCurentWeather(WeatherReqModel(cityName: 'Tehran', measure: 'metric')),
    );
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state.curentWeatherStatus is CurentWeatherLoading) {
                return Expanded(child: CustomLoading());
              }

              if (state.curentWeatherStatus is CurentWeatherCompleted) {
                final CurentWeatherCompleted curentWeatherCompleted =
                    state.curentWeatherStatus as CurentWeatherCompleted;
                final WeatherResEntity weatherResEntity =
                    curentWeatherCompleted.weatherResEntity;

                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        spacing: 10,
                        children: [
                          Text(
                            weatherResEntity.name!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            weatherResEntity.weather![0].description!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          WeatherWidgets.setIconForMain(
                            weatherResEntity.weather![0].description!,
                          ),
                          Text(
                            '${weatherResEntity.main!.temp!.round()}\u00b0',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      MaxMinTemp(weatherResEntity: weatherResEntity),
                    ],
                  ),
                );
              }
              if (state.curentWeatherStatus is Error) {
                return Center(child: Text('error'));
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather/features/weather/domain/entity/weather_res_entity.dart';
import 'package:weather/features/weather/presentation/widgets/weather_widgets.dart';

class WeatherCities extends StatelessWidget {
  const WeatherCities({super.key, required this.weatherResEntity});

  final WeatherResEntity weatherResEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

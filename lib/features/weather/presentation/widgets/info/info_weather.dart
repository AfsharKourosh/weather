import 'package:flutter/material.dart';
import 'package:weather/features/weather/domain/entity/weather_res_entity.dart';
import 'package:weather/features/weather/presentation/widgets/date_converter.dart';
import 'package:weather/features/weather/presentation/widgets/info/info_divider.dart';
import 'package:weather/features/weather/presentation/widgets/info/info_item.dart';

class InfoWeather extends StatelessWidget {
  const InfoWeather({super.key, required this.weatherResEntity});

  final WeatherResEntity weatherResEntity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.bodySmall;
    final weather = weatherResEntity;

    final items = [
      (title: 'wind speed', value: '${weather.wind?.speed ?? '--'} m/s'),
      (
        title: 'sunrise',
        value: DateConverter.changeDtToDateTimeHour(
          weather.sys?.sunrise,
          weather.timezone,
        ),
      ),
      (
        title: 'sunset',
        value: DateConverter.changeDtToDateTimeHour(
          weather.sys?.sunset,
          weather.timezone,
        ),
      ),
      (title: 'humidity', value: '${weather.main?.humidity ?? '--'}%'),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < items.length; i++) ...[
          if (i > 0) const InfoDivider(),
          InfoItem(title: items[i].title, value: items[i].value, style: theme),
        ],
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather/features/weather/domain/entity/weather_res_entity.dart';

class MaxMinTemp extends StatelessWidget {
  const MaxMinTemp({
    super.key,
    required this.weatherResEntity,
  });

  final WeatherResEntity weatherResEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          spacing: 8,
          children: [
            Text(
              'max',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '${weatherResEntity.main!.tempMax!.round()}\u00b0',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        SizedBox(
          height: 40,
          child: VerticalDivider(
            color: Colors.white,
            thickness: 2,
            width: 30,
          ),
        ),
    
        Column(
          spacing: 8,
          children: [
            Text(
              'min',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '${weatherResEntity.main!.tempMin!.round()}\u00b0',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}

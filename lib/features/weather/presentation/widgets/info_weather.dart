import 'package:flutter/material.dart';
import 'package:weather/features/weather/domain/entitys/weather_res_entity.dart';
import 'package:weather/features/weather/presentation/widgets/date_converter.dart';

class InfoWeather extends StatelessWidget {
  const new({super.key, required this.weatherResEntity});

  final WeatherResEntity weatherResEntity;

  @override
  Widget build(BuildContext context) {
    final sunrise = DateConverter.changeDtToDateTimeHour(
      weatherResEntity.sys!.sunrise,
      weatherResEntity.timezone,
    );
    final sunset = DateConverter.changeDtToDateTimeHour(
      weatherResEntity.sys!.sunset,
      weatherResEntity.timezone,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("wind speed", style: Theme.of(context).textTheme.bodySmall),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "${weatherResEntity.wind!.speed!} m/s",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
          child: VerticalDivider(color: Colors.white, thickness: 2, width: 30),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              Text("sunrise", style: Theme.of(context).textTheme.bodySmall),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  sunrise,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          child: VerticalDivider(color: Colors.white, thickness: 2, width: 30),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              Text("sunset", style: Theme.of(context).textTheme.bodySmall),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  sunset,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          child: VerticalDivider(color: Colors.white, thickness: 2, width: 30),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              Text("humidity", style: Theme.of(context).textTheme.bodySmall),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "${weatherResEntity.main!.humidity!}%",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

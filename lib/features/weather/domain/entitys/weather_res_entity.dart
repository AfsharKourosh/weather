class WeatherResEntity {
  final double lon;
  final double lat;
  final String description;
  final String weatherMain;
  final String icon;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final double? rainOneHour;
  final int clouds;
  final DateTime dateTime;
  final String country;
  final DateTime sunrise;
  final DateTime sunset;
  final int timezone;
  final int cityId;
  final String cityName;

  const WeatherResEntity({
    required this.lon,
    required this.lat,
    required this.description,
    required this.weatherMain,
    required this.icon,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    this.rainOneHour,
    required this.clouds,
    required this.dateTime,
    required this.country,
    required this.sunrise,
    required this.sunset,
    required this.timezone,
    required this.cityId,
    required this.cityName,
  });
}

import 'package:weather/features/weather/domain/entitys/weather_res_entity.dart';

class WeatherResModel {
  final CoordModel coord;
  final List<WeatherModel> weather;
  final String base;
  final MainWeatherModel main;
  final int visibility;
  final WindModel wind;
  final RainModel? rain;
  final CloudsModel clouds;
  final int dt;
  final SysModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  const WeatherResModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherResModel.fromJson(Map<String, dynamic> json) {
    return WeatherResModel(
      coord: CoordModel.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
      base: json['base'],
      main: MainWeatherModel.fromJson(json['main']),
      visibility: json['visibility'],
      wind: WindModel.fromJson(json['wind']),
      rain: json['rain'] != null ? RainModel.fromJson(json['rain']) : null,
      clouds: CloudsModel.fromJson(json['clouds']),
      dt: json['dt'],
      sys: SysModel.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'] is int ? json['cod'] : int.parse(json['cod'].toString()),
    );
  }

  WeatherResEntity toEntity() {
    final weatherData = weather.first;

    return WeatherResEntity(
      lon: coord.lon,
      lat: coord.lat,
      description: weatherData.description,
      weatherMain: weatherData.main,
      icon: weatherData.icon,
      temp: main.temp,
      feelsLike: main.feelsLike,
      tempMin: main.tempMin,
      tempMax: main.tempMax,
      pressure: main.pressure,
      humidity: main.humidity,
      visibility: visibility,
      windSpeed: wind.speed,
      windDeg: wind.deg,
      windGust: wind.gust,
      rainOneHour: rain?.oneHour,
      clouds: clouds.all,
      dateTime: DateTime.fromMillisecondsSinceEpoch(dt * 1000, isUtc: true),
      country: sys.country,
      sunrise: DateTime.fromMillisecondsSinceEpoch(
        sys.sunrise * 1000,
        isUtc: true,
      ),
      sunset: DateTime.fromMillisecondsSinceEpoch(
        sys.sunset * 1000,
        isUtc: true,
      ),
      timezone: timezone,
      cityId: id,
      cityName: name,
    );
  }
}

class CoordModel {
  final double lon;
  final double lat;

  const CoordModel({required this.lon, required this.lat});

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {'lon': lon, 'lat': lat};
}

class WeatherModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'main': main,
    'description': description,
    'icon': icon,
  };
}

class MainWeatherModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int? seaLevel;
  final int? grndLevel;

  const MainWeatherModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory MainWeatherModel.fromJson(Map<String, dynamic> json) {
    return MainWeatherModel(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
    );
  }

  Map<String, dynamic> toJson() => {
    'temp': temp,
    'feels_like': feelsLike,
    'temp_min': tempMin,
    'temp_max': tempMax,
    'pressure': pressure,
    'humidity': humidity,
    if (seaLevel != null) 'sea_level': seaLevel,
    if (grndLevel != null) 'grnd_level': grndLevel,
  };
}

class WindModel {
  final double speed;
  final int deg;
  final double? gust;

  const WindModel({required this.speed, required this.deg, this.gust});

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: (json['speed'] as num).toDouble(),
      deg: json['deg'],
      gust: (json['gust'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'speed': speed,
    'deg': deg,
    if (gust != null) 'gust': gust,
  };
}

class RainModel {
  final double? oneHour;

  const RainModel({this.oneHour});

  factory RainModel.fromJson(Map<String, dynamic> json) {
    return RainModel(oneHour: (json['1h'] as num?)?.toDouble());
  }

  Map<String, dynamic> toJson() => {if (oneHour != null) '1h': oneHour};
}

class CloudsModel {
  final int all;

  const CloudsModel({required this.all});

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(all: json['all']);
  }

  Map<String, dynamic> toJson() => {'all': all};
}

class SysModel {
  final int? type;
  final int? id;
  final String country;
  final int sunrise;
  final int sunset;

  const SysModel({
    this.type,
    this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  Map<String, dynamic> toJson() => {
    if (type != null) 'type': type,
    if (id != null) 'id': id,
    'country': country,
    'sunrise': sunrise,
    'sunset': sunset,
  };
}

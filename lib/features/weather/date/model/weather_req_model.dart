class WeatherReqModel {
  final String cityName;
  final String measure;

  const WeatherReqModel({required this.cityName, required this.measure});

  Map<String, dynamic> toQueryParameters() {
    return {
      'q': cityName,
      'units': measure,
      'appid': '1295d531fd0eea0b91c403ce6a1797ac',
    };
  }
}

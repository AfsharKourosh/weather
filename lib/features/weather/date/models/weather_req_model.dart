class WeatherReqModel {
  final String cityName;
  final String measure;

  const WeatherReqModel({required this.cityName, required this.measure});

  Map<String, dynamic> toQueryParameters() {
    return {'q': cityName, 'units': measure};
  }
}

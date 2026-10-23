import 'package:weather/core/logging/app_logger.dart';
import 'package:weather/core/network/client/api_client.dart';
import 'package:weather/features/weather/date/models/search_box_res_model.dart';
import 'package:weather/features/weather/date/models/weather_req_model.dart';
import 'package:weather/features/weather/date/models/weather_res_model.dart';

abstract interface class WeatherDataSource {
  Future<WeatherResModel> curentWeather(WeatherReqModel weatherReqModel);
  Future<SearchBoxResModel> searchBox(String prefix);
}

class WeatherDataSourceImpl implements WeatherDataSource {
  const WeatherDataSourceImpl(this.weatherApiClient, this.searchBoxApiClient);

  final ApiClient weatherApiClient;
  final ApiClient searchBoxApiClient;

  @override
  Future<WeatherResModel> curentWeather(WeatherReqModel weatherReqModel) async {
    final response = await weatherApiClient.get<Map<String, dynamic>>(
      '/data/2.5/weather',
      queryParameters: weatherReqModel.toQueryParameters(),
    );

    final responseData = response.data;

    if (responseData == null) {
      throw const FormatException('Response body is empty');
    }

    final weatherModel = WeatherResModel.fromJson(responseData);

    AppLogger.debug('Weather Response Model: $weatherModel');

    return weatherModel;
  }

  @override
  Future<SearchBoxResModel> searchBox(String prefix) async {
    final response = await searchBoxApiClient.get<Map<String, dynamic>>(
      '/v1/geo/cities',
      queryParameters: {'limit': 7, 'offset': 0, 'namePrefix': prefix},
    );

    final responseData = response.data;

    if (responseData == null) {
      throw const FormatException('Response body is empty');
    }

    final searchBoxModel = SearchBoxResModel.fromJson(responseData);

    AppLogger.debug('Weather Response Model: $searchBoxModel');

    return searchBoxModel;
  }
}

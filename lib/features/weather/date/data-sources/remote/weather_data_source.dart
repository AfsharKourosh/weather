import 'package:weather/core/logging/app_logger.dart';
import 'package:weather/core/network/client/api_client.dart';
import 'package:weather/features/weather/date/models/weather_req_model.dart';
import 'package:weather/features/weather/date/models/weather_res_model.dart';

abstract interface class WeatherDataSource {
  Future<WeatherResModel> curentWeather(WeatherReqModel weatherReqModel);
}

class WeatherDataSourceImpl implements WeatherDataSource {
  const WeatherDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<WeatherResModel> curentWeather(WeatherReqModel weatherReqModel) async {
    final response = await apiClient.get<Map<String, dynamic>>(
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
}

import 'package:weather/core/network/client/api_client.dart';
import 'package:weather/features/weather/date/data-sources/remote/remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<OtpResponseModel> otp(
    OtpRequestModel request,
  ) async {
    final response = await apiClient.post<Map<String, dynamic>>(
      'user/otp/',
      data: request.toJson(),
    );

    return OtpResponseModel.fromJson(
      response.data!,
    );
  }
}
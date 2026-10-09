import 'package:weather/core/network/client/api_client.dart';

abstract interface class AuthRemoteDataSource {
  Future<OtpResponse> otp(String phoneNumber);
}
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<OtpResponse> otp(String phoneNumber) async {
    final response = await apiClient.post<Map<String, dynamic>>(
      'auth/send/otp/',
      data: {
        'phone_number': phoneNumber,
      },
    );

    final responseData = response.data;

    if (responseData == null ||
        responseData['data'] is! Map<String, dynamic>) {
      throw const FormatException('Invalid OTP response format');
    }

    return OtpResponse.fromJson(
      responseData['data'] as Map<String, dynamic>,
    );
  }
}

 
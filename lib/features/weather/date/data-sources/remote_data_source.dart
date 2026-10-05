/*
abstract interface class AuthRemoteDataSource {
  Future<OtpResponseModel> otp(
    OtpRequestModel request,
  );
}
--------------------------------------------------
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
*/
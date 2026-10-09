abstract interface class AuthRemoteDataSource {
  Future<> otp(
    OtpRequestModel request,
  );
}

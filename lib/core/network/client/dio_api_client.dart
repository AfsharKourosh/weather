import 'package:dio/dio.dart';
import 'package:weather/core/error/exceptions/exception_mapper.dart';
import 'package:weather/core/network/client/api_client.dart';

class DioApiClient implements ApiClient {
  const DioApiClient(this.dio);

  final Dio dio;

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get<T>(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw ExceptionMapper.map(e);
    }
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw ExceptionMapper.map(e);
    }
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw ExceptionMapper.map(e);
    }
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw ExceptionMapper.map(e);
    }
  }
}

import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('''
---------- REQUEST ----------
${options.method}
${options.uri}

Headers:
${options.headers}

Data:
${options.data}
----------------------------
''');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('''
---------- RESPONSE ----------
${response.statusCode}
${response.requestOptions.uri}

Data:
${response.data}
-----------------------------
''');

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('''
---------- ERROR ----------
${err.type}

${err.message}

${err.response?.data}
--------------------------
''');

    handler.next(err);
  }
}

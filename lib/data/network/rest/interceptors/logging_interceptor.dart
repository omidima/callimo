import 'package:dio/dio.dart';

import '../../../../logic/util/logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.success("Network", [
      "REQUEST: ${options.method}",
      "PATH: ${options.baseUrl}${options.path}",
      "HEADER ${options.headers}",
      "DATA: ${options.data}",
    ]);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.success("Network", [
      "RESPONSE: ${response.statusCode}",
      "PATH: ${response.requestOptions.path}",
      "STATUS:${response.statusMessage}",
      "HEADER ${response.headers}",
      "DATA: ${response.toString()}",
    ]);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Logger.error("Network", [
      "ERROR: ${err.error}",
      "PATH: ${err.requestOptions.path}",
      "STATUS:${err.response?.statusCode}",
      "RESPONSE ${err.response?.data}",
    ]);
    return super.onError(err, handler);
  }
}

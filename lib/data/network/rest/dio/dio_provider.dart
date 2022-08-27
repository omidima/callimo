import 'package:dio/dio.dart';

import '../../../base/base_repository.dart';
import '../interceptors/authentication_interceptor.dart';
import '../interceptors/logging_interceptor.dart';
import '../services/rest_provider.dart';

class DioProvider {
  late Dio dio;
  late RestProvider restProvider;
  String? accessToken;
  static final DioProvider _instance = DioProvider._internal();

  factory DioProvider() => _instance;

  void setBaseUrl(String baseUrl) {
    BaseRepository.url = baseUrl;
    restProvider = RestProvider(dio, baseUrl: BaseRepository.url);
  }

  DioProvider._internal() {
    dio = Dio(BaseOptions(connectTimeout: 20000, receiveTimeout: 20000))
      ..interceptors.add(LoggingInterceptor())
    ..interceptors.add(AuthenticationInterceptor());
    restProvider = RestProvider(dio, baseUrl: BaseRepository.url);
  }

  
}

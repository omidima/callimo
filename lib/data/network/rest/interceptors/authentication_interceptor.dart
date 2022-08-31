import 'package:callimoo/data/provider/websoket/socket_manager.dart';
import 'package:callimoo/main.dart';
import 'package:dio/dio.dart';
import '../../../../logic/util/helper.dart';
import '../../../../logic/util/logger.dart';
import '../../../base/base_repository.dart';
import '../../../base/pref_key.dart';
import '../dio/dio_provider.dart';

class AuthenticationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = await Callimoo.config.get(PrefKey.ACCESS_TOKEN);
    options.headers["Authorization"] = "Bearer $accessToken";

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode != 401) {
      return super.onResponse(response, handler);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response == null || err.response!.statusCode == 401) {
      String? refreshToken = await Callimoo.config.get(PrefKey.REFRESH_TOKEN);

      if (refreshToken != null) {
        await _getNewToken(err, handler);
      } else {
        return super.onError(err, handler);
      }
    } else {
      return super.onError(err, handler);
    }
  }

  _getNewToken(DioError error, ErrorInterceptorHandler handler) async {
    // await _lockDio();
    // try {
    String refreshToken = await Callimoo.config.get(PrefKey.REFRESH_TOKEN);
    var dio = Dio();
    var response = await dio.post(
        '${BaseRepository.url}j_spring_jwt_security_check',
        options: Options(headers: {"Refresh": refreshToken}));
    await _setNewToken(response);
    // await _unLocDio();
    await _requestAgainLastApiCall(error, handler);
    // } catch (e) {
    //   // await _unLocDio();
    //   return super.onError(error, handler);
    // }
  }

  // _getNewKeycloakToken(DioError error, ErrorInterceptorHandler handler) async {
  //   FlutterAppAuth appAuth = FlutterAppAuth();
  //   var refreshToken =
  //       await Pref.get(key: PrefKey.KEYCLOAK_REFRESH_TOKEN, isSecure: true);
  //   var clientId =
  //       await Pref.get(key: PrefKey.KEYCLOAK_CLIENT_ID, isSecure: true);

  //   final TokenResponse? result = await appAuth.token(TokenRequest(
  //       clientId, KEYCLOAK_REDIRECT_URL,
  //       refreshToken: refreshToken, scopes: ['openid']));

  //   if (result != null) {
  //     await Pref.set(
  //         key: PrefKey.KEYCLOAK_ACCESS_TOKEN,
  //         input: result.accessToken,
  //         isSecure: true);
  //     await Pref.set(
  //         key: PrefKey.KEYCLOAK_REFRESH_TOKEN,
  //         input: result.refreshToken,
  //         isSecure: true);
  //     _getNewToken(error, handler);
  //   }
  // }

  _setNewToken(Response response) async {
    await Callimoo.config.put(
      PrefKey.ACCESS_TOKEN,
      tokenFinder(response.headers.toString()),
    );
    await Callimoo.config.put(
      PrefKey.REFRESH_TOKEN,
      refreshTokenFinder(response.headers.toString()),
    );

    SocketManager.getInstance.reconnectWebSockets();
  }

  _requestAgainLastApiCall(
      DioError error, ErrorInterceptorHandler handler) async {
    try {
      RequestOptions options = error.requestOptions;
      var response = await DioProvider().dio.request(
          "${BaseRepository.url}${options.path}",
          options: Options(method: options.method),
          data: options.data,
          queryParameters: options.queryParameters,
          onReceiveProgress: options.onReceiveProgress,
          onSendProgress: options.onSendProgress,
          cancelToken: options.cancelToken);
      handler.resolve(response);
    } catch (e) {
      Logger.warning(
          'api', "request again ${"NetworkExceptions.getDioException(e)"}");
    }
  }
}

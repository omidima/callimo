
import '../network/rest/dio/dio_provider.dart';
import '../network/rest/services/rest_provider.dart';

abstract class BaseRepository {
  static String url = "https://web.limoo.im/Limonad/";
  // static String url = "https://test.limonadapp.ir/Limonad/";
  DioProvider provider = DioProvider();

  RestProvider get restProvider {
    return provider.restProvider;
  }

  void setBaseUrl(String baseUrl) async {
    // await Pref.set(
    //     key: PrefKey.BASEURL, input: baseUrl + "/Limonad/", isSecure: true);
    provider.setBaseUrl(baseUrl + "/Limonad/");
  }

  void updateBaseUrl(String baseUrl) {
    provider.setBaseUrl(baseUrl);
  }

  // StreamSubscription<ConnectivityResult> networkStateManagment(
  //     {Function? onNoInternetConnection, Function? onHasInternetConnection}) {
  //   return Connectivity().onConnectivityChanged.listen((event) {
  //       App.connectivityResult = event.index;
  //       switch (event.index) {
  //         case 2:
  //           Logger.info("internet connection none", "event.toString()");
  //           if (onNoInternetConnection != null) onNoInternetConnection();
  //           break;
  //         case 1:
  //           Logger.info("internet connection mobile", "event.toString()");
  //           if (onHasInternetConnection != null) onHasInternetConnection();
  //           break;
  //         case 0:
  //           Logger.info("internet connection wifi", "event.toString()");
  //           if (onHasInternetConnection != null) onHasInternetConnection();
  //           break;
  //       }
  //   });
  // }

  // Future<bool> checkInternetConnection() async {
  //   try {
  //     var data = await Dio().post(Uri.parse("https://google.com"));
  //     if (data.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }
}

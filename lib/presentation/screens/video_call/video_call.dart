import 'dart:convert';
import 'dart:io';

import 'package:callimoo/data/repositories/config_repository.dart';
import 'package:callimoo/logic/util/logger.dart';
import "package:flutter/foundation.dart" show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:callimoo/data/hive/objects/call_item_object.dart';
import 'package:callimoo/main.dart';

import '../../../data/base/pref_key.dart';
import '../../../logic/constants/colors/app_colors.dart';

class VideoCallScreen extends StatefulWidget {
  static get pageName => "/call";
  static route(CallItemObject item, bool? isAdmin) => MaterialPageRoute(
        settings: RouteSettings(name: "/video-call/sessions/${item.id}"),
        builder: (context) => VideoCallScreen(
          meetingId: (isAdmin ?? false) ? item.adminLink : item.publicLink!,
          isAdmin: isAdmin ?? false,
        ),
      );

  String meetingId;
  bool isAdmin;
  VideoCallScreen({Key? key, required this.meetingId, this.isAdmin = false})
      : super(key: key) {
    if (!isAdmin) {
      if (kIsWeb) {
        // js.context.callMethod('open', [meetingId]);
      }
    }
  }

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  String? accessToken;
  late String domain;

  _getAccessToken() async {
    accessToken = await Callimoo.config.get(PrefKey.ACCESS_TOKEN);
    if (isPlatform()) {
      if (!(await Permission.microphone.isGranted ||
          await Permission.camera.isGranted)) {
        var statuses = await [
          Permission.microphone,
          Permission.storage,
          Permission.camera,
        ].request();
        setState(() {});
      } else {
        setState(() {});
      }
    } else {
      // await getPermission();
      setState(() {});
    }
  }

  @override
  void initState() {
    _getAccessToken();
    super.initState();
  }

  isPlatform() {
    try {
      Platform.isAndroid || Platform.isIOS;
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kIsWeb ? Colors.white : AppColors.secondaryDarkColor,
      body: Stack(alignment: Alignment.center, children: [
        accessToken == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : isPlatform()
                ? _OsWebview(
                    uri: widget.meetingId,
                    token: accessToken,
                  )
                : Center(
                    child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                            "برای مدیریت جلسات و دیدن تاریحچه کامل آنها، به لیمو وارد شوید و در فضای کاری کالیمو در گروه **جلسات** میتوانید لیستی از تماسهای تصویری خود را مشاهده نمایید. \n لیمو یک ابزار پیام‌رسان درون تیمی/سازمانی است که به شما کمک میکنه بتوانید ارتباط یکپارچه و مؤثری را بر با همکاران خود داشته باشید."),
                        const SizedBox(height: 20,),
                        InkWell(
                          onTap: () async {
                            if (kIsWeb) {
                              await launchUrl(
                                  Uri.parse("https://web.limoo.im"));
                            }else {
                              Navigator.of(context).pushNamed(
                                  VideoCallScreen.pageName,
                                  arguments: [
                                    CallItemObject()
                                      ..name = "call"
                                      ..adminLink = "https://web.limoo.im"
                                      ..publicLink = "https://web.limoo.im"
                                      ..createdAt = 0
                                      ..id = "call",
                                    true
                                  ]);
                            }
                          },
                          child: const Text(
                            "به لیمو وارد شوید",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  )),
      ]),
    );
  }
}

class _OsWebview extends StatefulWidget {
  String uri;
  String? token;
  _OsWebview({
    Key? key,
    required this.uri,
    this.token,
  }) : super(key: key);
  @override
  __OsWebviewState createState() => new __OsWebviewState();
}

class __OsWebviewState extends State<_OsWebview> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        userAgent: Platform.isIOS ?
            "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.117 Safari/537.36" : "",
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
        useWideViewPort: true
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        try {
          if (Platform.isAndroid) {
            webViewController?.reload();
          } else if (Platform.isIOS) {
            webViewController?.loadUrl(
                urlRequest: URLRequest(url: await webViewController?.getUrl()));
          }
        } catch (e) {}
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        color: AppColors.secondaryColor,
        width: double.infinity,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.secondaryColor)),
                    child: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    "بازگشت",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              ElevatedButton(
                child: Icon(Icons.refresh),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.secondaryColor)),
                onPressed: () {
                  webViewController?.reload();
                },
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Stack(
          children: [
            InAppWebView(
              key: webViewKey,
              initialOptions: options,
              pullToRefreshController: pullToRefreshController,
              onWebViewCreated: (controller) async {
                webViewController = controller;
                // get the CookieManager instance
                var cookieManager;
                if (Platform.isIOS) {
                  cookieManager = IOSCookieManager.instance();
                } else {
                  cookieManager = CookieManager.instance();
                }

                await webViewController!.loadUrl(
                    urlRequest: URLRequest(
                        url: Uri.parse(widget.uri),
                        headers: {"Authorization": 'Bearer ${widget.token}'}));

                // set the access token
                await cookieManager.setCookie(
                    url: Uri.parse("https://web.limoo.im"),
                    name: "ACCESSTOKEN",
                    value: widget.token ?? "",
                    isSecure: true,
                    isHttpOnly: false,
                    sameSite: HTTPCookieSameSitePolicy.NONE);
              },
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                return NavigationActionPolicy.ALLOW;
              },
              onLoadStop: (controller, url) async {
                pullToRefreshController.endRefreshing();
                setState(() {
                  urlController.text = widget.uri;
                });
              },
              onLoadError: (controller, url, code, message) {
                pullToRefreshController.endRefreshing();
              },
              onProgressChanged: (controller, progress) {
                if (progress == 100) {
                  pullToRefreshController.endRefreshing();
                }
                setState(() {
                  this.progress = progress / 100;
                  urlController.text = widget.uri;
                });
              },
              onUpdateVisitedHistory: (controller, url, androidIsReload) {
                setState(() {
                  urlController.text = widget.uri;
                });
              },
              onConsoleMessage: (controller, consoleMessage) {
                print(consoleMessage);
              },
            ),
            progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : Container(),
          ],
        ),
      ),
    ]);
  }
}

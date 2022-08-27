// import 'dart:convert';
// import 'dart:io';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:limonad_flutter/core/base/base_repository.dart';
// import 'package:limonad_flutter/core/constants/assets.dart';
// import 'package:limonad_flutter/core/exceptions/network_exceptions.dart';
// import 'package:limonad_flutter/data/network/dto/message/message_created.dart';
// import 'package:limonad_flutter/provider/websoket/socket_event.dart';
// import '../../data/network/dto/config/attach_device_dto.dart';
// import 'package:firebase_core/firebase_core.dart';

// enum AppState {
//   foreground,
//   background,
//   terminated,
// }

// class NotificationManager extends BaseRepository {
//   NotificationManager._();
//   factory NotificationManager() => _instance;
//   static final NotificationManager _instance = NotificationManager._();

//   Future<void> init() async {
//     setFCMToken();
//   }

//   setFCMToken() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
    
//     /// requesting permission for [alert], [badge] & [sound]. Only for iOS
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: false,
//       sound: true,
//     );
//     // NotificationSettings settings = await messaging.getNotificationSettings();
//     /// saving token only if user granted access.
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       String? token = await messaging.getToken();
//       if (token != null) {
//         _setTokenToServer(token);
//         _configure();
//       }
//     }

//     messaging.onTokenRefresh.listen((event) {
//       print('PushNotificationsManager: _handleNotification 24 $event ');
//     });

//   }

//   /// when app is in background or terminated state
//   // Future<void> _firebaseMessagingBackgroundHandler(
//   //     RemoteMessage message) async {
//   //   showNotification(message.data['data'], message.data['event']);
//   // }

//   void _configure() async {
//     /// For iOS only, setting values to show the notification when the app is in foreground state.
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     AwesomeNotifications().initialize(
//         // set the icon to null if you want to use the default app icon
//         null,
//         [
//           NotificationChannel(
//               channelKey: 'basic_channel',
//               channelName: 'Basic notifications',
//               channelDescription: 'Notification channel for basic tests',
//               importance: NotificationImportance.High,
//               defaultColor: Color(0xFF9D50DD),
//               ledColor: Colors.white)
//         ]);

//     /// when app is in forground state
//     /// firebase notification that showing it handled by OS (ios)
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       // showNotification(message.data['data'],  message.data['event']);
//     });

//     /// handler when user taps on the notification.
//     /// For iOS, it gets executed when the app is in [foreground] / [background] state.
//     /// For Android, it gets executed when the app is in [background] state.
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       _handleNotification(message: message.data, appState: AppState.foreground);
//     });

//     /// If the app is launched from terminated state by tapping on a notification, [getInitialMessage] function will return the
//     /// [RemoteMessage] only once.
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();

//     /// if [RemoteMessage] is not null, this means that the app is launched from terminated state by tapping on the notification.
//     if (initialMessage != null) {
//       _handleNotification(
//           message: initialMessage.data, appState: AppState.terminated);
//     }
//   }

//   // void showNotification(dynamic data, String event) {
//   //   var push = MessageCreated.fromMap(json.decode(data));
//   //   print('PushNotificationsManager: ${push.message} ${push.UserDisplayName}}');
//   //   String des = '';
//   //   if (event == SocketEvent.MESSAGE_CREATED.event && push.message != null) {
//   //     print("PushNotificationsManager: $event");
//   //     if (push.message!.type == "VOICE_MESSAGE") {
//   //       des = 'پیام صوتی';
//   //     } else if (push.message!.files != null &&
//   //         push.message!.files!.isNotEmpty) {
//   //       des = 'فایل';
//   //     } else {
//   //       des = push.message!.text!;
//   //     }
//   //     AwesomeNotifications().createNotification(
//   //         content: NotificationContent(
//   //       id: 10,
//   //       channelKey: 'basic_channel',
//   //       title: push.UserDisplayName,
//   //       body: des,
//   //     ));
//   //   }
//   // }

//   void _handleNotification({
//     required Map<String, dynamic> message,
//     AppState? appState,
//   }) async {
//     print(
//         'PushNotificationsManager: _handleNotification ${message.toString()} ${appState.toString()}');
//   }

//   void _setTokenToServer(String token) async {
//     try {
//       await restProvider.attachDevice(AttachDeviceDto(deviceToken: token));
//       // print("PushNotificationsManager token sent to server $token");
//     } catch (error) {
//       print(
//           "PushNotificationsManager sending token to server has error $error");
//       var exception = NetworkExceptions.getDioException(error);
//       print("PushNotificationsManager exception $exception");
//     }
//   }
// }


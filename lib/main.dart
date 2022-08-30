import 'dart:ui';

import 'package:callimoo/data/base/pref_key.dart';
import 'package:callimoo/data/hive/objects/call_item_object.dart';
import 'package:callimoo/data/network/dto/conversation/conversation_dto.dart';
import 'package:callimoo/data/network/dto/user/user_dto.dart';
import 'package:callimoo/data/network/dto/workspace/workspace_dto.dart';
import 'package:callimoo/logic/constants/colors/app_colors.dart';
import 'package:callimoo/presentation/screens/login/signup/signup_screen.dart';
import 'package:callimoo/presentation/screens/main/call_log/call_detail_screen.dart';
import 'package:callimoo/presentation/screens/main/main_screen.dart';
import 'package:callimoo/presentation/screens/video_call/video_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/provider/websoket/socket_manager.dart';
import 'logic/cubit/login/login_cubit.dart';
import 'logic/util/logger.dart';
import 'presentation/screens/login/login/login_page.dart';
import 'presentation/screens/login/otp_registration/otp_registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  Logger.setDebugMode = false;
  await Hive.initFlutter();
  Hive.registerAdapter(CallItemObjectAdapter());
  Hive.registerAdapter(WorkspaceDtoAdapter());
  Hive.registerAdapter(WorkerNodeDtoAdapter());
  Hive.registerAdapter(ConversationDtoAdapter());
  Hive.registerAdapter(UserDtoAdapter());

  await Hive.openBox("config");
  await Hive.openBox<CallItemObject>("calls");
  // await Hive.box("config").deleteFromDisk();
  runApp(Callimoo());
}

class Callimoo extends StatelessWidget with WidgetsBindingObserver {
  late String route;
  static Box config = Hive.box("config");
  static Box<CallItemObject> calls = Hive.box("calls");

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state.index) {
      case 0:
        SocketManager.getInstance.reconnectWebSockets();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  Callimoo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    route = (Callimoo.config.get(PrefKey.ACCESS_TOKEN) == null)
        ? LoginPage.pageName
        : MainScreen.pageName;
    return MaterialApp(
      title: "Callimoo",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == MainScreen.pageName) {
          return MainScreen.route;
        }
        if (settings.name == LoginPage.pageName) {
          return LoginPage.route;
        }
        if (settings.name == OtpRegistrationScreen.pageName) {
          return OtpRegistrationScreen.route(settings.arguments as LoginCubit);
        }
        if (settings.name == SignupUserScreen.pageName) {
          return SignupUserScreen.route;
        }
        if (settings.name == VideoCallScreen.pageName) {
          // if (settings.arguments == null) {
          //   return VideoCallScreen.route(CallItemObject().., false);
          // }
          return VideoCallScreen.route((settings.arguments as List<dynamic>)[0],
              (settings.arguments as List<dynamic>)[1]);
        }
        if (settings.name == CallDetailScreen.pageName) {
          return CallDetailScreen.route(settings.arguments as CallItemObject);
        }
      },
      initialRoute: route,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      locale: const Locale('fa'),
      supportedLocales: const [
        Locale("fa"),
        Locale("en"),
      ],
      color: AppColors.primaryColor,
      theme: ThemeData(
        fontFamily: "Yekan",
      ),
    );
  }
}

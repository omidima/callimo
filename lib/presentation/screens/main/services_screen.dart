import 'dart:io';

import 'package:callimoo/data/hive/objects/call_item_object.dart';
import 'package:callimoo/logic/cubit/services/services_cubit.dart';
import 'package:callimoo/main.dart';
import 'package:callimoo/presentation/screens/login/login/login_page.dart';
import 'package:callimoo/presentation/screens/video_call/video_call.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:callimoo/logic/constants/colors/app_colors.dart';
import 'package:callimoo/logic/constants/style/app_style.dart';
import 'package:callimoo/presentation/widget/image_loader.dart';
import 'package:callimoo/presentation/widget/view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesScreen extends StatefulWidget {
  ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends CallimooViewState<ServicesScreen>
    with _Widget {
  ServicesCubit _cubit = ServicesCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: super.build(context)),
      ),
    );
  }

  @override
  Widget desktopView(BuildContext context) {
    return Container(
      width: 720,
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * .98,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 0),
                color: Colors.black.withOpacity(.12))
          ]),
      child: mobileView(context),
    );
  }

  @override
  Widget mobileView(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16).copyWith(top: 32),
      child: SafeArea(
        child: Column(
          children: [
            BlocBuilder<ServicesCubit, ServicesState>(
              builder: (context, state) {
                if (_cubit.user == null) {
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.grey_7),
                      child:
                          Opacity(opacity: 0, child: accountBox(name: "name")));
                } else {
                  return accountBox(name: _cubit.user!.getDisplayName());
                }
              },
            ),
            const SizedBox(
              height: 24,
            ),
            _SettingBox(title: "تنظیمات کاربری", options: [
              _SettingBoxItem(
                  icon: Image.asset(
                    "assets/lemon-old.png",
                    width: 20,
                  ),
                  title: "ورود به لیمو",
                  onClick: () async {
                    try {if (Platform.isAndroid || Platform.isIOS) {
                      Navigator.of(context)
                          .pushNamed(VideoCallScreen.pageName, arguments: [
                        CallItemObject()
                          ..name = "call"
                          ..adminLink = "https://web.limoo.im"
                          ..publicLink = "https://web.limoo.im"
                          ..createdAt = 0
                          ..id = "call",
                        true
                      ]);
                    }}catch(e){
                      await launchUrl(Uri.parse("https://web.limoo.im"),
                          mode: LaunchMode.externalApplication,
                          webOnlyWindowName: "window",
                          webViewConfiguration: WebViewConfiguration(
                              enableJavaScript: true, enableDomStorage: true));
                    }
                  }),
              _SettingBoxItem(
                  icon: const Icon(
                    Icons.logout,
                    color: AppColors.errorStateColor,
                  ),
                  color: AppColors.errorStateColor,
                  title: "خارج شدن از حساب",
                  onClick: () async {
                    await Callimoo.calls.clear();
                    await Callimoo.config.clear();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginPage.pageName, (route) => false);
                  })
            ]),
            const SizedBox(
              height: 12,
            ),
            _SettingBox(title: "تنظیمات کاربری", options: [
              _SettingBoxItem(
                  icon: const Icon(Icons.chrome_reader_mode_outlined),
                  title: "درباره لیمو",
                  onClick: () async {
                    await launchUrl(Uri.parse("https://limoo.im/"));
                  }),
              _SettingBoxItem(
                  icon: const Icon(Icons.help_outline),
                  title: "راهنما",
                  onClick: () async {
                    await launchUrl(Uri.parse("https://limoo.im/help/"));
                  }),
              _SettingBoxItem(
                  icon: const Icon(Icons.help_outline),
                  title: "قوانین و شرایط استفاده از لیمو",
                  onClick: () async {
                    await launchUrl(Uri.parse("https://limoo.im/blog/"));
                  }),
            ])
          ],
        ),
      ),
    );
  }

  @override
  Widget tabletView(BuildContext context) {
    return Container(
      width: 600,
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * .98,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 0),
                color: Colors.black.withOpacity(.12))
          ]),
      child: mobileView(context),
    );
  }
}

mixin _Widget {
  Widget accountBox({required String name, String? imageHash}) => Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  blurRadius: 16,
                  color: Colors.black.withOpacity(.04),
                  offset: const Offset(0, 6))
            ]),
        child: Row(
          children: [
            ImageLoader(
                iconHash: imageHash, text: name, width: 50, isCircle: true),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppStyle.body_bold,
                ),
                Text(
                  "برای مدیریت حساب به لیمو وارد شوید",
                  style: AppStyle.body.copyWith(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      );
}

class _SettingBoxItem extends StatelessWidget {
  Widget icon;
  String title;
  Color color;
  Function() onClick;
  _SettingBoxItem(
      {Key? key,
      required this.icon,
      required this.title,
      this.color = Colors.black,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: AppStyle.body_bold.copyWith(color: color),
            )
          ],
        ),
      ),
    );
  }
}

class _SettingBox extends StatelessWidget {
  String title;
  List<_SettingBoxItem> options;
  _SettingBox({
    Key? key,
    required this.title,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                blurRadius: 16,
                color: Colors.black.withOpacity(.04),
                offset: const Offset(0, 6))
          ]),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
                  .copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero),
              color: AppColors.grey_9,
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              title,
              style: const TextStyle(color: AppColors.grey_3, fontSize: 12),
            ),
          ),
          ...options
        ],
      ),
    );
  }
}

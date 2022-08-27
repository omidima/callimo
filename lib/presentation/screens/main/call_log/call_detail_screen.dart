import 'package:callimoo/data/hive/objects/call_item_object.dart';
import 'package:callimoo/logic/constants/colors/app_colors.dart';
import 'package:callimoo/logic/constants/style/app_style.dart';
import 'package:callimoo/logic/cubit/call_detail/call_detail_cubit.dart';
import 'package:callimoo/presentation/screens/video_call/video_call.dart';
import 'package:callimoo/presentation/widget/call_log_item.dart';
import 'package:callimoo/presentation/widget/form_input/form_button.dart';
import 'package:callimoo/presentation/widget/limoo_logo.dart';
import 'package:callimoo/presentation/widget/view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class CallDetailScreen extends CallimooView {
  static get pageName => "/detail";
  static route(CallItemObject item) => MaterialPageRoute(
        settings: RouteSettings(name: "/call/detail/${item.name}"),
        builder: (context) => CallDetailScreen(item: item),
      );

  CallItemObject item;
  late CallDetailCubit _cubit;
  CallDetailScreen({required this.item, Key? key}) : super(key: key) {
    _cubit = CallDetailCubit(item: item);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Center(child: SafeArea(child: super.build(context))),
          )),
    );
  }

  @override
  Widget desktopView(BuildContext context) {
    return Container(
      width: 720,
      padding: const EdgeInsets.all(16).copyWith(bottom: 0),
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
      padding: const EdgeInsets.all(16).copyWith(bottom: 0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: _Widgets.appBar,
          ),
          const SizedBox(
            height: 20,
          ),
          _Widgets.itemView(item, () => _cubit.remove()),
          const SizedBox(
            height: 24,
          ),
          FormButton(
              onPressed: () {
                Navigator.of(context).pushNamed(VideoCallScreen.pageName,
                    arguments: [item, true]);
              },
              height: 58,
              width: double.infinity,
              child: Text(
                "ورود به عنوان مدیر جلسه",
                style: AppStyle.body_bold,
              )),
          const SizedBox(
            height: 12,
          ),
          MaterialButton(
              height: 58,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: AppColors.primaryColor)),
              elevation: 0,
              color: Colors.white,
              onPressed: () async {
                Clipboard.setData(ClipboardData(text: item.publicLink));
                Fluttertoast.showToast(
                    msg: "لینک جلسه کپی شد.",
                    backgroundColor: AppColors.primaryColor,
                    fontSize: 14,
                    gravity: ToastGravity.BOTTOM,
                    webShowClose: true,
                    textColor: Colors.white);
              },
              minWidth: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "اشتراک گذاری لینک جلسه",
                    style: AppStyle.body_bold,
                  ),
                  const Icon(Icons.share)
                ],
              )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(12).copyWith(
                        bottomLeft: Radius.zero, bottomRight: Radius.zero)),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/app_logo.png',
                        width: 25,
                      ),
                      const SizedBox(
                        width: 7.5,
                      ),
                      Text(
                        "همین حالا لیمو رو نصب کن",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  @override
  Widget tabletView(BuildContext context) {
    return Container(
      width: 600,
      padding: const EdgeInsets.all(16).copyWith(bottom: 0),
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

class _Widgets {
  static get appBar => Row(
        children: const [
          Directionality(
              textDirection: TextDirection.ltr,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              )),
          SizedBox(
            width: 10,
          ),
          Text(
            "لیست جلسات",
            style: TextStyle(fontSize: 12),
          ),
        ],
      );

  static itemView(CallItemObject item, Function action) => Container(
        child: CallLogItem(
          title: item.name,
          time: item.createdAt,
          description:
              "برای مدیرت و بررسی پیام‌ها و افراد حاضر در جلسه فضای کاری خود را در لیمو چک کنید",
          onDeletedClick: () {
            action();
          },
          onGoClick: () {},
          isDetail: true,
        ),
      );
}

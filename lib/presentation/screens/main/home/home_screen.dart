import 'package:callimoo/presentation/screens/main/call_log/call_detail_screen.dart';
import 'package:callimoo/presentation/widget/view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/hive/objects/call_item_object.dart';
import '../../../../data/provider/publisher/event/create_message_event.dart';
import '../../../../data/provider/publisher/event_publisher.dart';
import '../../../../logic/constants/colors/app_colors.dart';
import '../../../../logic/constants/style/app_style.dart';
import '../../../../logic/cubit/home/home_cubit.dart';
import '../../../../logic/util/helper.dart';
import '../../../../main.dart';
import '../../../widget/form_input/form_button.dart';
import '../../../widget/form_input/form_text_input.dart';
import '../../../widget/limoo_logo.dart';
import '../../video_call/video_call.dart';

class HomeScreen extends CallimooView with _Widgets {
  static get route => MaterialPageRoute(
        settings: const RouteSettings(name: "/home"),
        maintainState: true,
        builder: (context) => HomeScreen(),
      );
  HomeScreen({Key? key})
      : isOpenModal = false,
        super(key: key) {
    socket();
  }

  bool isOpenModal;
  late BuildContext context;

  socket() {
    EventPublisher.getInstance().on<CreateMessageEvent>().listen((event) {
      var onj = CallItemObject()
        ..id = event.messageDto!.id!
        ..name = titleFinder(event.messageDto!.text!)!
        ..adminLink = adminLinkFinder(event.messageDto!.text!)!
        ..publicLink = publicLinkFinder(event.messageDto!.text!)
        ..createdAt = event.messageDto?.createAt;
      Callimoo.calls.add(onj);
      if (isOpenModal) {
        Navigator.of(context).pop();
        Navigator.of(context)
            .pushNamed(CallDetailScreen.pageName, arguments: onj);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: Center(child: super.build(context)),
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _limoo(),
            Expanded(
                child: _form(context,
                    (value) => Navigator.of(context)
                        .pushNamed('/call', arguments: [value, false]),
                    () => showDialog(
                        context: context,
                        builder: (context) {
                          isOpenModal = true;
                          return Dialog(
                            child: _CreateCall(
                              onCancell: null,
                              onSubmit: (e) {
                                Navigator.of(context).pop();
                                print("clicked");
                              },
                            ),
                          );
                        })))
          ],
        ),
      ),
    );
  }

  @override
  Widget tabletView(BuildContext context) {
    return Container(
      width: 600,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 0),
                color: Colors.black.withOpacity(.12))
          ]),
      child: mobileView(context),
    );
  }
}

mixin _Widgets {
  Widget _limoo() {
    return LimooLogo(title: "به کالیمو خوش اومدی.");
  }

  Widget _form(BuildContext context,Function(String? value) onSubmit, Function() onCreateSession) {
    String? value;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/start.png",
          width: 150,
        ),
        const SizedBox(
          height: 28,
        ),
        FormTextInput(
            lable: "ورود به جلسه تصویری",
            hint: "لینک جلسه را وارد نمایید",
            icon: InkWell(
              onTap: () async {
                if (value != null) {
                  Navigator.of(context)
                      .pushNamed(VideoCallScreen.pageName, arguments: [
                    CallItemObject()
                      ..name = "call"
                      ..adminLink = value!.replaceAll(" ", "")
                      ..publicLink = value!.replaceAll(" ", "")
                      ..createdAt = 0
                      ..id = "call",
                    true
                  ]);
                }
              },
              child: const Icon(Icons.arrow_forward),
            ),
            onChange: (e) {
              value = e;
            }),
        const SizedBox(
          height: 28,
        ),
        Text(
          "یا",
          style: AppStyle.subtitle,
        ),
        const SizedBox(
          height: 28,
        ),
        FormButton(
            height: 58,
            onPressed: onCreateSession,
            child: Text(
              "ساخت جلسه جدید",
              style: AppStyle.body_bold,
            ))
      ],
    );
  }

  _createDialog(Function onCreate) {}
}

class _CreateCall extends StatefulWidget {
  Function()? onCancell;
  Function(String value)? onSubmit;
  _CreateCall({this.onCancell, this.onSubmit, Key? key}) : super(key: key);

  @override
  State<_CreateCall> createState() => __CreateCallState();
}

class __CreateCallState extends State<_CreateCall> {
  HomeCubit _cubit = HomeCubit();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is CallCreatedState) {
            Navigator.of(context).pop();
          }
        },
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: 300,
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Image.asset(
                    "assets/new_call.png",
                    width: 80,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("نام جلسه جدید را وارد کنید"),
                  const Spacer(),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is CreateCallLoadingState) {
                        return Container(
                          padding: const EdgeInsets.all(12),
                          child: const CircularProgressIndicator(),
                        );
                      }
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: AppColors.primaryColor,
                                hintText: "نام جلسه جدید",
                              ),
                              cursorColor: AppColors.primaryColor,
                              onChanged: (value) {
                                _cubit.name = value;
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FormButton(
                                    width: 80,
                                    color: AppColors.primaryColor,
                                    onPressed: () {
                                      _cubit.createCallMessage();
                                      widget.onSubmit!("Asdc");
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.check),
                                        Text("تایید")
                                      ],
                                    )),
                                FormButton(
                                    color: AppColors.white,
                                    width: 80,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      widget.onCancell != null
                                          ? widget.onCancell!()
                                          : null;
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [Text("انصراف")],
                                    ))
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

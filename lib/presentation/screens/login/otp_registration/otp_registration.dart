import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../logic/constants/assets.dart';
import '../../../../logic/constants/colors/app_colors.dart';
import '../../../../logic/constants/dimens/dimens.dart';
import '../../../../logic/constants/strings/strings.dart';
import '../../../../logic/constants/style/app_style.dart';
import '../../../../logic/cubit/login/login_cubit.dart';
import '../../../../logic/cubit/otp/otp_cubit.dart';
import '../../../widget/form_input/form_button.dart';
import '../../../widget/view_state.dart';

class OtpRegistrationScreen extends StatefulWidget {
  static get pageName => "/otp";
  static route(LoginCubit cubit) => MaterialPageRoute(
        settings: RouteSettings(name: "otp"),
        builder: (context) => OtpRegistrationScreen(widgetBloc: cubit),
      );
  LoginCubit widgetBloc;
  OtpRegistrationScreen({Key? key, required this.widgetBloc}) : super(key: key);

  @override
  _OtpRegistrationScreenState createState() => _OtpRegistrationScreenState();
}

class _OtpRegistrationScreenState
    extends CallimooViewState<OtpRegistrationScreen> {
  OtpCubit _bloc = OtpCubit();
  TextEditingController textEditingController = TextEditingController();
  bool hasError = false;
  String currentText = "";
  late Timer _timer;
  String txtVerifyButton = Strings.verifyCode;
  dynamic _start = 60;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _bloc.changeNumber(widget.widgetBloc.phoneNumber);
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _start = 60;
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            _start = 0;
            timer.cancel();
            _bloc.invalidCode();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.widgetBloc,
      child: BlocProvider(
        create: (context) => _bloc,
        child: Scaffold(
          backgroundColor: AppColors.secondaryColor,
          body: BlocListener<OtpCubit, OtpState>(
            listener: _listener,
            listenWhen: (previous, current) {
              if (previous != current) {
                return true;
              }
              return false;
            },
            child: SingleChildScrollView(
                child: Center(child: super.build(context))),
          ),
        ),
      ),
    );
  }

  Widget _headerItem() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.sms,
            width: 120,
          ),
          const SizedBox(
            height: 16,
          ),
          RichText(
            text: TextSpan(
                text: Strings.sendingCode_1,
                style: AppStyle.body
                    .copyWith(color: AppColors.grey_3, fontFamily: "Yekan"),
                children: [
                  TextSpan(
                    text:
                        "${widget.widgetBloc.phoneNumber.replaceAll("+", "")}+",
                    style: AppStyle.body.copyWith(
                      color: AppColors.black,
                      fontFamily: "Yekan",
                    ),
                  ),
                  TextSpan(
                    text: Strings.sendingCode_2,
                    style: AppStyle.body
                        .copyWith(color: AppColors.grey_3, fontFamily: "Yekan"),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Widget _footerItem() {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            bottom: 54,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Padding(
                  padding: Dimens.padding,
                  child: _codeInput(),
                ),
                const SizedBox(
                  height: 54,
                ),
                _submit(),
              ],
            ),
          )
        ],
      ),
    );
  }

  FocusNode keyboardFocus = FocusNode();
  _codeInput() {
    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, state) {
        return Column(
          children: [
            Directionality(
                textDirection: TextDirection.ltr,
                child: TextField(
                  focusNode: keyboardFocus,
                  controller: textEditingController,
                  maxLength: 5,
                  onChanged: (value) {
                    if (value.length == 5 &&
                        MediaQuery.of(context).viewInsets.bottom > 0) {
                      keyboardFocus.unfocus();
                    }
                    _bloc.changeCode(value);
                  },
                  keyboardType: TextInputType.number,
                )),
            InkWell(
                onTap: () {
                  _bloc.resendCode();
                },
                child: state is OtpInvalidTime
                    ? Text(
                        Strings.resend,
                        style:
                            AppStyle.body_bold.copyWith(color: AppColors.black),
                      )
                    : state is OtpError
                        ? Text(Strings.invalidCode,
                            style: AppStyle.body_bold
                                .copyWith(color: AppColors.errorStateColor))
                        : Container()),
          ],
        );
      },
    );
  }

  _submit() {
    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, state) {
        if (state is OtpError ||
            state is OtpInvalidTime ||
            state is InitState) {
          return FormButton(
            child: Text(Strings.verifyCode,
                style: AppStyle.buttonText.copyWith(color: AppColors.grey_5)),
            onPressed: null,
          );
        }
        return FormButton(
          isLoading: state is OtpLoading,
          child: Text(Strings.verifyCode, style: AppStyle.buttonText),
          onPressed: () {
            _bloc.submit();
          },
        );
      },
      buildWhen: (previous, current) {
        if (previous != current) {
          return true;
        }
        return false;
      },
    );
  }

  _listener(context, state) {
    if (state is OtpSuccess) {
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false,
          arguments: true);
    }
    if (state is UserNeedSignup) {
      Navigator.pushNamed(context, "/signup");
    }
  }

  @override
  Widget desktopView(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 600,
        color: Colors.white,
        height: MediaQuery.of(context).size.height * .98,
        alignment: Alignment.center,
        padding: Dimens.padding,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: const [
                    Icon(Icons.arrow_forward_ios_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    Text("ویرایش شماره موبایل"),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _headerItem(),
                      _codeInput(),
                    ],
                  ),
                ),
              ),
              _submit()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget mobileView(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      padding: Dimens.padding,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_ios_new_sharp),
                  SizedBox(
                    width: 5,
                  ),
                  Text("ویرایش شماره موبایل"),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _headerItem(),
                    _codeInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    _submit()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget tabletView(BuildContext context) {
    return desktopView(context);
  }
}

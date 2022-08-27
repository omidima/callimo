import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/constants/assets.dart';
import '../../../../logic/constants/colors/app_colors.dart';
import '../../../../logic/constants/dimens/dimens.dart';
import '../../../../logic/constants/strings/strings.dart';
import '../../../../logic/constants/style/app_style.dart';
import '../../../../logic/cubit/login/login_cubit.dart';
import '../../../../logic/cubit/login/login_state.dart';
import '../../../widget/form_input/form_button.dart';
import '../../../widget/form_input/phone_number_input.dart';
import '../../../widget/view_helper.dart';
import '../../../widget/view_state.dart';
import '../otp_registration/otp_registration.dart';

class LoginPage extends StatefulWidget {
  static get pageName => "/login";
  static get route => MaterialPageRoute(
        settings: RouteSettings(name: "/login"),
        builder: (context) => LoginPage(),
      );
  bool hasOrganization;
  LoginPage({Key? key, this.hasOrganization = false}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends CallimooViewState<LoginPage> {
  LoginCubit _bloc = LoginCubit();
  late LoginState _current;

  @override
  void initState() {
    _current = InitLoginState();
    _bloc.stream.listen((state) {
      if (_current != state) {
        if (state is LoginSuccess) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OtpRegistrationScreen(
              widgetBloc: _bloc,
            ),
          ));
        }
        if (state is LoginFailer) {
          snackBar(context, "مجددا تلاش فرمایید");
        }
      }
    });
    super.initState();
  }

  _listener(BuildContext context, LoginState state) {
    if (state is LoginFailer) {
      if (state.error != null) {
        setState(() {
          _hasError = true;
        });
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(state.error.toString())));
      }
    }

    if (state is NumberInvalide) {
      setState(() {
        _hasError = true;
      });
    }

    if (state is LoginSuccess) {
      Navigator.of(context).push(OtpRegistrationScreen.route(_bloc));
    }
  }

  Widget _headerItem() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.signin,
            width: 120,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            Strings.loginInterPhoneNumber,
            style: AppStyle.body.copyWith(color: AppColors.grey_3),
          ),
          const SizedBox(
            height: 16,
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
            bottom: 22,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 24,
                ),
                _submit(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.loginWithUsername,
                      style: AppStyle.body.copyWith(
                          color: AppColors.secondaryColor,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  bool _hasError = false;
  Widget _phoneNumber(BuildContext context) {
    return PhoneNumberInput(
      hasError: (hasError) {
        setState(() {
          _hasError = hasError;
        });
      },
      onChange: (code, number) {
        _bloc.checkNumber(_hasError, code + number);
      },
    );
  }

  Widget _submit() {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return FormButton(
          isLoading: state is LoginLoading,
          child: Text(Strings.getToken,
              style: AppStyle.buttonText.copyWith(
                  color: state is LoginFailer
                      ? AppColors.grey_5
                      : AppColors.secondaryDarkColor)),
          onPressed: state is LoginFailer || state is InitLoginState
              ? null
              : () {
                  // Navigator.of(context).pushNamed("/otp", arguments: _bloc);
                  _bloc.phoneVerification();
                },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => _bloc,
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: BlocListener<LoginCubit, LoginState>(
          listener: _listener,
          child: Center(child: super.build(context)),
        ),
      ),
    );
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
        child: mobileView(context),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _headerItem(),
              _phoneNumber(context),
            ],
          )),
          _submit()
        ],
      ),
    );
  }

  @override
  Widget tabletView(BuildContext context) {
    return desktopView(context);
  }
}

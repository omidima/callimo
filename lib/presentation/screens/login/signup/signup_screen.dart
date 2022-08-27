import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/constants/colors/app_colors.dart';
import '../../../../logic/constants/dimens/dimens.dart';
import '../../../../logic/constants/strings/strings.dart';
import '../../../../logic/constants/style/app_style.dart';
import '../../../../logic/cubit/signup/signup_bloc.dart';
import '../../../widget/form_input/form_button.dart';
import '../../../widget/form_input/form_text_input.dart';
import '../../../widget/view_state.dart';

class SignupUserScreen extends StatefulWidget {
  static get pageName => "/signup";
  static get route => MaterialPageRoute(
      settings: RouteSettings(name: "signup"),
      builder: (context) => SignupUserScreen());
  const SignupUserScreen({Key? key}) : super(key: key);

  @override
  _SignupUserScreenState createState() => _SignupUserScreenState();
}

class _SignupUserScreenState extends CallimooViewState<SignupUserScreen> {
  SignupCubit _bloc = SignupCubit();

  bool _hasFirstname = true;
  bool _hasLastname = true;
  bool _hasEmail = true;
  Widget _form() {
    return Column(
      children: [
        FormTextInput(
          lable: Strings.signupFirstname,
          hint: Strings.signupFirstnameHint,
          error: Text(
            Strings.signupFirstnameError,
            style: AppStyle.body.copyWith(color: AppColors.errorStateColor),
          ),
          onChange: (text) {
            _bloc.changeFirstname(text);
          },
          isError: !_hasFirstname,
        ),
        const SizedBox(
          height: 35,
        ),
        FormTextInput(
          lable: Strings.signupLastname,
          hint: Strings.signupLastnameHint,
          error: Text(
            Strings.signupLastnameError,
            style: AppStyle.body.copyWith(color: AppColors.errorStateColor),
          ),
          onChange: (text) {
            _bloc.changeLastname(text);
          },
          isError: !_hasLastname,
        ),
      ],
    );
  }

  Widget _footer() {
    if (_hasLastname && _hasFirstname && _hasEmail) {
      return FormButton(
        onPressed: () {
          _bloc.submit();
        },
        child: Text(
          Strings.signupSubmit,
          style: AppStyle.body,
        ),
      );
    }
    return FormButton(
      onPressed: null,
      child: Text(
        Strings.signupSubmit,
        style: AppStyle.body,
      ),
    );
  }

  void _listener(BuildContext context, SignupState state) {
    if (state is FirstnameChecked) {
      setState(() {
        _hasFirstname = state.state;
      });
    }

    if (state is LastnameChecked) {
      setState(() {
        _hasLastname = state.state;
      });
    }

    if (state is EmailChecked) {
      setState(() {
        _hasEmail = state.state;
      });
    }

    if (state is UpdateSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/",
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: BlocListener<SignupCubit, SignupState>(
          listener: _listener,
          child: Center(
            child: SingleChildScrollView(child: super.build(context)),
          ),
        ),
      ),
    );
  }

  @override
  Widget desktopView(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: Colors.white,
        width: 600,
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * .98,
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
      child: SafeArea(
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 24,
                ),
                _form()
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    child: _footer(),
                    bottom: 14,
                    left: 0,
                    right: 0,
                  )
                ],
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

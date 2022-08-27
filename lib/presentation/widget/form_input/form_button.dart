import 'package:flutter/material.dart';

import '../../../logic/constants/colors/app_colors.dart';
import '../../../logic/constants/dimens/dimens.dart';

class FormButton extends StatefulWidget {
  Function()? onPressed;
  Widget child;
  bool isLoading;
  Color color;
  double elevetion;
  double? width;
  double? height;
  BorderRadius? borderRadius;

  FormButton(
      {required this.onPressed,
      required this.child,
      this.isLoading = false,
      this.color = AppColors.primaryColor,
      this.width = double.infinity,
      this.height = 48,
      this.elevetion = 0,
      this.borderRadius});

  @override
  _FormButton createState() => _FormButton();
}

class _FormButton extends State<FormButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        disabledColor: AppColors.primaryLightColor,
        shape: RoundedRectangleBorder(
            borderRadius: widget.borderRadius == null
                ? Dimens.borderRadius
                : widget.borderRadius!),
        elevation: widget.elevetion,
        color: widget.color,
        child: widget.isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: AppColors.primaryDarkColor,
                  strokeWidth: 3,
                ),
              )
            : widget.child,
        disabledTextColor: AppColors.black,
        minWidth: widget.width,
        height: widget.height,
        textColor: AppColors.secondaryDarkColor);
  }
}

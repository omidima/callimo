import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../logic/constants/colors/app_colors.dart';
import '../../../logic/constants/dimens/dimens.dart';

class FormTextInput extends StatefulWidget {
  String lable;
  String description;
  String hint;
  TextDirection direction;
  TextInputType type;
  Widget? icon;
  bool isObscure;
  Function(String text) onChange;
  Widget? error;
  bool isError;

  FormTextInput(
      {Key? key,
      required this.lable,
      required this.onChange,
      this.description = '',
      this.hint = '',
      this.direction = TextDirection.rtl,
      this.type = TextInputType.text,
      this.icon,
      this.isObscure = false,
      this.error,
      this.isError = false})
      : super(key: key);

  @override
  _FormTextInputState createState() => _FormTextInputState();
}

class _FormTextInputState extends State<FormTextInput> {
  TextEditingController _controller = TextEditingController();
  late bool isValue;

  @override
  void initState() {
    isValue = false;
    _controller.addListener(() {
      if (_controller.value.text.isNotEmpty) {
        setState(() {
          isValue = true;
        });
      } else {
        setState(() {
          isValue = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
          Text(
            widget.lable,
            style: TextStyle(
                color: widget.isError
                    ? AppColors.errorStateColor
                    : AppColors.secondaryDarkColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Stack(
            children: [
              TextFormField(
                obscuringCharacter: "*",
                obscureText: widget.isObscure,
                cursorColor: AppColors.secondaryDarkColor,
                cursorWidth: 1,
                textDirection: widget.direction,
                style: TextStyle(
                    fontSize: 14, color: AppColors.secondaryDarkColor),
                onChanged: widget.onChange,
                controller: _controller,
                decoration: InputDecoration(
                  hintTextDirection: widget.direction,
                  contentPadding: Dimens.padding.copyWith(left: 40),
                  filled: true,
                  fillColor: AppColors.inputBackgroundColor,
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: Dimens.borderRadius,
                      borderSide: isValue
                          ? BorderSide(
                              width: 1.5,
                              color: widget.isError
                                  ? AppColors.errorStateColor
                                  : AppColors.secondaryDarkColor,
                            )
                          : BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: Dimens.borderRadius,
                      borderSide: BorderSide(
                        width: 1.5,
                        color: widget.isError
                            ? AppColors.errorStateColor
                            : AppColors.secondaryDarkColor,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: Dimens.borderRadius,
                      borderSide: BorderSide(
                        width: 1.5,
                        color: widget.isError
                            ? AppColors.errorStateColor
                            : AppColors.secondaryDarkColor,
                      )),
                ),
              ),
              widget.icon != null
                  ? Positioned(
                      top: 0,
                      bottom: 0,
                      left: 8,
                      child: widget.icon!,
                    )
                  : Container()
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          widget.isError && widget.error != null
              ? widget.error!
              : SizedBox(
                  height: 0,
                )
        ]));
  }
}

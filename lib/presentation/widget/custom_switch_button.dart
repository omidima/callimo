import 'package:flutter/material.dart';

import '../../logic/constants/colors/app_colors.dart';
import '../../logic/constants/dimens/dimens.dart';

class FormButtonGroup extends StatefulWidget {
  final List<Widget> children;
  final int initValue;
  final Function(int value) onChange;
  const FormButtonGroup(
      {Key? key,
      required this.children,
      required this.initValue,
      required this.onChange})
      : super(key: key);

  @override
  _FormButtonGroupState createState() => _FormButtonGroupState();
}

class _FormButtonGroupState extends State<FormButtonGroup> {
  late int _active ;

  @override
  void initState() {
    _active = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: Dimens.borderRadius,
          color: AppColors.inputBackgroundColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Row(
        children: List.generate(
          widget.children.length,
          (index) => Expanded(
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    textColor:
                        _active == index ? AppColors.white : AppColors.grey_2,
                    height: 52,
                    onPressed: () {
                      setState(() {
                        _active = index;
                        widget.onChange(index);
                      });
                    },
                    child: FittedBox(
                      child: widget.children[index],
                      alignment: Alignment.center,
                    ),
                    color: _active == index
                        ? AppColors.secondaryColor
                        : AppColors.inputBackgroundColor,
                  ),
                )
        ),
      ),
    );
  }
}

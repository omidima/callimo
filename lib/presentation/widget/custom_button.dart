import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.radius, required this.color, required this.textStyle, required this.onPressed}) : super(key: key);

  final String text;
  final double radius;
  final Color color;
  final TextStyle textStyle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius))),
      ),
      child:  Text(text ,style: textStyle)
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.red,
      ),
    );
  }
}
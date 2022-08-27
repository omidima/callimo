import 'package:flutter/material.dart';

abstract class CallimooViewState<T extends StatefulWidget> extends State<T>
    implements BaseView {
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileView(context);
        } else if (constraints.maxWidth >= 500 && constraints.maxWidth < 940) {
          return tabletView(context);
        } else {
          return desktopView(context);
        }
      },
    );
  }
}

abstract class CallimooView extends StatelessWidget implements BaseView {
  CallimooView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileView(context);
        } else if (constraints.maxWidth >= 500 && constraints.maxWidth < 940) {
          return tabletView(context);
        } else {
          return desktopView(context);
        }
      },
    );
  }
}

abstract class BaseView {
  Widget desktopView(BuildContext context);

  Widget mobileView(BuildContext context);

  Widget tabletView(BuildContext context);
}

import 'package:callimoo/logic/constants/assets.dart';
import 'package:flutter/cupertino.dart';

import '../../logic/constants/dimens/dimens.dart';
import '../../logic/constants/strings/strings.dart';

class LimooLogo extends StatelessWidget {
  final String title;
  LimooLogo({this.title = Strings.enterToApp});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.AppLogo, width: 50),
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        SizedBox(height: Dimens.size_20)
      ],
    );
  }
}

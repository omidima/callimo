import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../logic/constants/style/app_style.dart';
import 'image_loader.dart';

class UserRowItem extends StatelessWidget {
  String? name;
  String? iconHash;
  String? email;
  String? number;
  bool isAdmin;

  UserRowItem(
      {Key? key,
      required this.name,
      required this.iconHash,
      this.isAdmin = false,
      this.email,
      this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageLoader(
                      isCircle: true,
                      width: 50,
                      height: 50,
                      iconHash: iconHash,
                      text: name),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name != null ? name! : '',
                        style: AppStyle.heading_3.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        _handleSubtitle(),
                        style: AppStyle.caption,
                      )
                    ],
                  ))
                ]),
          ),
          isAdmin ? Text('admin') : Container()
        ],
      ),
    );
  }

  _handleSubtitle() {
    if (email != null) {
      return email;
    } else if (number != null) {
      return number;
    } else {
      return '';
    }
  }
}

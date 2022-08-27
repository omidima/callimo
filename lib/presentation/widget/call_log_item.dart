import 'package:callimoo/logic/constants/colors/app_colors.dart';
import 'package:callimoo/logic/constants/style/app_style.dart';
import 'package:callimoo/presentation/widget/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

class CallLogItem extends StatelessWidget {
  String title;
  String? description;
  int? time;
  bool isDetail;
  String? iconHash;
  Function() onDeletedClick;
  Function() onGoClick;
  CallLogItem(
      {required this.title,
      this.description,
      this.isDetail = false,
      this.time,
      this.iconHash,
      required this.onDeletedClick,
      required this.onGoClick,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(.08),
                offset: const Offset(0, 0))
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppStyle.body_bold.copyWith(fontSize: 16),
                  softWrap: true,
                ),
              ),
              isDetail
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MaterialButton(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () {
                            onDeletedClick();
                          },
                          padding: const EdgeInsets.all(0),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              'حذف کردن',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          color: const Color(0xffea6c80),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          minWidth: 60,
                          onPressed: () {
                            onDeletedClick();
                          },
                          child: const Text(
                            "حذف",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 50,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () {
                            onGoClick();
                          },
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          color: AppColors.primaryColor,
                        ),
                      ],
                    )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              description != null
                  ? Row(
                      children: [
                        Expanded(
                            child: Text(
                          description!,
                          style:
                              TextStyle(color: AppColors.grey_3, fontSize: 12),
                          softWrap: true,
                        )),
                        Opacity(
                          opacity: 0,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MaterialButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                onPressed: () {
                                  onDeletedClick();
                                },
                                padding: const EdgeInsets.all(0),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    'حذف کردن',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                                color: const Color(0xffea6c80),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Container(),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconHash != null
                      ? ImageLoader(
                          iconHash: iconHash,
                          text: "user",
                          width: 25,
                        )
                      : Image.asset(
                          "assets/avatar.png",
                          width: 25,
                        ),
                  time != null
                      ? Text(
                          _timeHandel(),
                          style: AppStyle.body
                              .copyWith(color: AppColors.secondaryColor),
                        )
                      : Container(),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  String _timeHandel() {
    var date = Jalali.fromDateTime(DateTime.fromMillisecondsSinceEpoch(time!))
        .formatter;

    return "${date.yyyy} ${date.mN} ${date.dd}";
  }
}

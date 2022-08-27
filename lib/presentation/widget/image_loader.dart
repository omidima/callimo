import 'package:cached_network_image/cached_network_image.dart';
import 'package:callimoo/main.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../../data/base/pref_key.dart';
import '../../logic/constants/dimens/dimens.dart';
import '../../logic/constants/strings/strings.dart';

class ImageLoader extends StatefulWidget {
  final String? iconHash;

  /// if iconHash was null then we should show first word of text
  final String? text;
  final bool isCircle;
  final double width;
  final double height;
  final double radius;
  ImageLoader(
      {required this.iconHash,
      required this.text,
      this.isCircle = false,
      this.width = Dimens.size_40,
      this.height = Dimens.size_40,
      this.radius = Dimens.size_18});
  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  final StringBuffer url = StringBuffer();
  Map<String, String> header = Map();

  @override
  Widget build(BuildContext context) {
    if (widget.iconHash != null && widget.iconHash!.isNotEmpty) {
      return FutureBuilder(
        future: _generateUrl(widget.iconHash!),
        builder: (context, snapshot) {
          if (url.toString().isNotEmpty) {
            return CachedNetworkImage(
                width: widget.width,
                height: widget.height,
                imageUrl: url.toString(),
                httpHeaders: header,
                imageBuilder: (context, imageProvider) {
                  if (widget.isCircle) {
                    return CircleAvatar(
                      radius: Dimens.size_18,
                      backgroundImage: imageProvider,
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) =>
                        //           ImageViewer(image: imageProvider),
                        //     ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image: imageProvider)),
                      ),
                    );
                  }
                },
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) {
                  developer.log("ImageLoader error => $error");
                  return Icon(Icons.error);
                });
          } else {
            return Text("${snapshot.error}");
          }
        },
      );
    } else {
      return Container(
        width: widget.width,
        height: widget.height,
        child: CircleAvatar(
          radius: widget.radius,
          backgroundColor: Colors.blueAccent,
          child: Text(
            widget.text?.substring(0, 1) ?? "",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }

  _generateUrl(String iconHash) async {
    await Callimoo.config.get(PrefKey.ACCESS_TOKEN).then((accessToken) {
      header["Authorization"] = "Bearer $accessToken";
    });
    var fileUrl = await Callimoo.config.get(PrefKey.WORKER_FILE_URL);
    print("images ${fileUrl}");
    this.url.clear();
    this.url.write("${fileUrl.toString()}/v1/files?mode=view&hash=$iconHash");
  }
}

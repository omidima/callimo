// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:limonad_flutter/core/base/resource.dart';
// import 'package:limonad_flutter/core/constants/colors/past_app_colors.dart';
// import 'package:limonad_flutter/data/repositories/files_repository.dart';
// import 'package:limonad_flutter/util/logger.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../core/constants/colors/app_colors.dart';

// class VoiceLoader extends StatefulWidget {
//   String? fileHash;
//   String? fileName;

//   VoiceLoader({this.fileHash, required this.fileName});
//   @override
//   _ImageLoaderState createState() => _ImageLoaderState();
// }

// class _ImageLoaderState extends State<VoiceLoader> {
//   FilesRepository _repo = FilesRepository.getInstance;
//   String _counter = "00:00";
//   final player = AudioPlayer();
//   double _sliderValue = 0;
//   double _sliderMax = 1;
//   Icon _iconState = Icon(Icons.play_arrow);
//   bool isPlayed = false;
//   bool isLoading = true;

//   @override
//   void initState() {
//     _handelVoice();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 _counter,
//                 style: TextStyle(fontSize: 12),
//               ),
//               Directionality(
//                 textDirection: TextDirection.ltr,
//                 child: SizedBox(
//                   height: 20,
//                   child: Slider(
//                     min: 0,
//                     max: _sliderMax,
//                     value: _sliderValue,
//                     onChanged: (double value) {
//                       _pauseVoice();
//                       player.seek(Duration(seconds: value.toInt()));
//                       _playVoice();
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         isLoading
//             ? CircularProgressIndicator()
//             : Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.primaryColor,
//                     borderRadius: BorderRadius.circular(50)),
//                 child: SizedBox(
//                   width: 35,
//                   height: 35,
//                   child: IconButton(
//                       padding: EdgeInsets.all(0),
//                       color: Colors.white,
//                       iconSize: 16,
//                       onPressed: () {
//                         setState(() {
//                           if (isPlayed) {
//                             _pauseVoice();
//                           } else {
//                             _playVoice();
//                           }
//                         });
//                       },
//                       icon: _iconState),
//                 ),
//               )
//       ],
//     );
//   }

//   _handelVoice() async {
//     if (widget.fileHash == null) return;
//     print('voice message: ${widget.fileName}');

//     var value = await _repo.downloadFile(
//       widget.fileHash!,
//       widget.fileName!.split('.').first + ".aac",
//       progress: (progress) => print("downloader: $progress"),
//     );

//     if (value.status == ResourceStatus.success) {
//       print('voice message: ${value.data}');
//       try {
//         _voiceDuration(await player.setFilePath(value.data!.first.path));
//         _voiceDuration(await player.setFilePath(value.data!.first.path));
//       } catch (e) {
//         if (File(value.data!.first.path).existsSync()) {
//           _voiceDuration(await player.setFilePath(value.data!.first.path));
//         } else {
//           print("voice error: cant play $e");
//         }
//       }

//       // loading state change
//       player.processingStateStream.listen((event) {
//         if (event == ProcessingState.ready) {
//           setState(() {
//             isLoading = false;
//           });
//         }
//         if (event == ProcessingState.completed) {
//           setState(() {
//             _stopVoice();
//           });
//         }
//       });

//     } else if (value.status == ResourceStatus.failed) {
//       print("voice error: cant play");
//     }
//   }

//   _playVoice() {
//     //  set position stream
    
//     setState(() {
//       isPlayed = true;
//       _sliderMax = player.duration!.inMilliseconds.toDouble();
//       _iconState = Icon(Icons.pause);
//     });

//     player.positionStream.listen((event) {
//       setState(() {
//         _sliderValue = event.inMilliseconds.toDouble();
//         _counter =
//             "${(event.inSeconds / 60 < 10) ? "0${event.inSeconds ~/ 60}" : event.inSeconds / 60}:${(event.inSeconds % 60 < 10) ? "0${event.inSeconds % 60}" : event.inSeconds % 60}";
//       });
//     });


//     player.play();
//   }

//   _stopVoice() {
//     player.stop();
//     player.seek(Duration(seconds: 0));
//     setState(() {
//       _counter = "00:00";
//       _iconState = Icon(Icons.play_arrow);
//       _sliderValue = 0;
//       isPlayed = false;
//     });
//   }

//   _pauseVoice() {
//     player.pause();
//     setState(() {
//       _iconState = Icon(Icons.play_arrow);
//       isPlayed = false;
//     });
//   }

//   _voiceDuration(Duration? d) {
//     String time = "";
//     int min = (d!.inMinutes % 60).round();
//     if (min < 10) {
//       time += "0$min:";
//     } else {
//       time += "$min:";
//     }

//     int sec = (d.inSeconds % 60).round();
//     if (sec < 10) {
//       time += "0$sec";
//     } else {
//       time += "$sec";
//     }

//     setState(() {
//       _counter = time;
//     });
//   }
// }

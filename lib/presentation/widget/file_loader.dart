// import 'dart:io';

// import 'package:flutter/material.dart';

// class FileLoader extends StatefulWidget {
//   final String? iconHash;
//   final String? fileName;
//   final bool isUpload;
//   Stream<int>? uploadPercent;
//   File? uploadFile;

//   FileLoader(
//       {required this.iconHash,
//       required this.fileName,
//       this.isUpload = false,
//       this.uploadPercent,
//       this.uploadFile});
//   @override
//   _FileLoaderState createState() => _FileLoaderState();
// }

// class _FileLoaderState extends State<FileLoader> {
//   FilesRepository repository = FilesRepository.getInstance;
//   FileAttachment? file;
//   FileInfoDto? fileInfo;
//   bool isDownloading = false;
//   int downloadPercent = 0;

//   @override
//   void initState() {
//     widget.iconHash != null ? _checkDownloadedFile(widget.iconHash!) : null;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.isUpload) {
//       return Column(
//         children: [
//           Row(
//             children: [
//               _fileIcon(widget.uploadFile!.path.split('.')[1]),
//               Column(
//                 children: [
//                   Text(widget.uploadFile!.path.split('/').last),
//                   Text(widget.uploadFile!.lengthSync().toString())
//                 ],
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Icon(Icons.close),
//               StreamBuilder<int>(
//                 initialData: 0,
//                 stream: widget.uploadPercent,
//                 builder: (context, snapshot) {
//                   return Row(
//                     children: [
//                       Slider(
//                         value: snapshot.data!.toDouble(),
//                         min: 0,
//                         max: 100,
//                         onChanged: (double value) {},
//                       ),
//                       Text('${snapshot.data}%')
//                     ],
//                   );
//                 },
//               )
//             ],
//           )
//         ],
//       );
//     } else if (isDownloading) {
//       return Column(
//         children: [
//           Row(
//             children: [
//               _fileIcon(fileInfo!.mimeType!.split('/')[1]),
//               SizedBox(
//                 width: 20,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                       width: 100,
//                       child: Text(fileInfo!.name.toString(),
//                           overflow: TextOverflow.fade, maxLines: 1)),
//                   Text(_handleSize(fileInfo!.size ?? 0))
//                 ],
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Icon(Icons.close),
//               Expanded(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Slider(
//                         value: downloadPercent.toDouble(),
//                         min: 0,
//                         max: 100,
//                         onChanged: (double value) {},
//                       ),
//                     ),
//                     Text('$downloadPercent%')
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       );
//     } else if (file != null) {
//       return InkWell(
//         onTap: () => _openFile(),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 _fileIcon(file!.path.split('.')[1]),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(
//                           width: 100,
//                           child: Text(file!.path.split('/').last,
//                               maxLines: 1, overflow: TextOverflow.fade),
//                         )
//                       ],
//                     ),
//                     Text(_handleSize(File(file!.path).lengthSync()))
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       );
//     } else if (fileInfo != null) {
//       return Column(
//         children: [
//           InkWell(
//             onTap: () => _downloadFile(widget.iconHash!),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _fileIcon(fileInfo!.mimeType!.split('/')[1]),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                         width: 100,
//                         child: Text(fileInfo!.name.toString(),
//                             overflow: TextOverflow.fade, maxLines: 1)),
//                     Text(_handleSize(fileInfo!.size ?? 0))
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       );
//     } else {
//       return CircularProgressIndicator();
//     }
//   }

//   Widget _fileIcon(String extensions) {
//     return Container(
//       width: 65,
//       height: 50,
//       child: Stack(
//         children: [
//           Positioned(
//               left: 5,
//               child: Icon(
//                 Icons.insert_drive_file_rounded,
//                 color: Colors.grey,
//                 size: 55,
//               )),
//           Positioned(
//             bottom: 5,
//             left: 0,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: Colors.redAccent),
//               child: Text(
//                 extensions,
//                 style: TextStyle(fontSize: 12),
//               ),
//             ),
//           ),
//           file == null && fileInfo != null
//               ? Positioned(
//                   right: 10,
//                   bottom: 0,
//                   child: Icon(Icons.file_download_rounded),
//                 )
//               : Container()
//         ],
//       ),
//     );
//   }

//   _downloadFile(String iconHash) async {
//     setState(() {
//       isDownloading = true;
//     });

//     var data = await repository.downloadFile(
//       iconHash,
//       widget.fileName!,
//       progress: (progress) {
//         setState(() {
//           downloadPercent = progress;
//         });
//       },
//     );

//     if (data.status == ResourceStatus.success) {
//       print('download file: success');

//       setState(() {
//         file = data.data![0];
//         isDownloading = false;
//       });
//     } else {
//       print('download file: error');
//     }
//   }

//   _loadFileInformation(String iconHash) async {
//     var result = await repository.getFileInfo(iconHash);
//     result.when(
//         success: (e) {
//           setState(() {
//             fileInfo = e;
//           });
//         },
//         failure: (e) {});
//   }

//   _checkDownloadedFile(String iconHash) async {
//     var f = await App.DATABASE.fileAttachmentDao.getFile(iconHash);

//     if (f.isNotEmpty) {
//       setState(() {
//         file = f[0];
//       });
//     } else {
//       _loadFileInformation(iconHash);
//     }
//   }

//   _openFile() async {
//     OpenFile.open(file!.path);
//   }

//   String _handleSize(int size) {
//     int kb = size ~/ 1024;
//     if (kb <= 102400) {
//       return '$kb kb';
//     } else {
//       return '${size ~/ 102400} mb';
//     }
//   }
// }

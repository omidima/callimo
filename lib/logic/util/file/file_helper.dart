// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:mime/mime.dart';
// import 'package:permission_handler/permission_handler.dart';

// const VIDEO_DIR = "Videos";
// const AUDIO_DIR = "Audios";
// const IMAGE_DIR = "Images";
// const OTHER_DIR = "Others";

// class FileHelper {
//   static final FileHelper _instance = FileHelper._internal();
//   FileHelper._internal();
//   static FileHelper get getInstance => _instance;

//   // limoo app root directory file manager
//   getDirectoryPathLimoo() async {
//     Directory appDocumentsDirectory;
//     if (Platform.isIOS) {
//       appDocumentsDirectory = await getApplicationDocumentsDirectory();
//     } else {
//       appDocumentsDirectory = (await getExternalStorageDirectory())!;
//     }

//     return "/${appDocumentsDirectory.path}";
//   }

//   _getDirectoryFileLimoo(String mimeType) async {
//     String rootPath = await getDirectoryPathLimoo();
//     if (!await Permission.storage.status.isGranted) {
//       Permission.storage.request();
//     }
//     // @here
//     try {
//       final Directory _appDirectoryFilesFolder =
//           Directory("$rootPath/${_getCorrectFolder(mimeType)}/");
//       if (await _appDirectoryFilesFolder.exists()) {
//         return _appDirectoryFilesFolder.path;
//       } else {
//         final Directory _appDocDirNewFolder =
//             await _appDirectoryFilesFolder.create(recursive: true);

//         return _appDocDirNewFolder.path;
//       }
//     } catch (e) {
//       print("present: crash $e");
//     }
//   }

//   Future<File> getNewFileLimoo(String fileType) async {
//     String time = DateTime.now().microsecondsSinceEpoch.toString();
//     var fileDir = await _getDirectoryFileLimoo(fileType);
//     var preName = _getIdentifyFileName(fileType);
//     File file = File(fileDir + preName + time + '.' + fileType);
//     file.createSync();
//     return file;
//   }

//   // app file helper
//   Future<String> _getApplicationRootPath() async {
//     Directory appDocumentsDirectory;
//     appDocumentsDirectory = await getTemporaryDirectory();
//     String appDocumentsPath = appDocumentsDirectory.path;
//     return appDocumentsPath;
//   }

//   String _getCorrectFolder(String mimeType) {
//     if (mimeType == "audio")
//       return AUDIO_DIR;
//     else if (mimeType == "image")
//       return IMAGE_DIR;
//     else if (mimeType == "application")
//       return IMAGE_DIR;
//     else if (mimeType == "video")
//       return VIDEO_DIR;
//     else
//       return OTHER_DIR;
//   }

//   String _getIdentifyFileName(String mimeType) {
//     if (mimeType == "audio")
//       return "AUDIO_";
//     else if (mimeType == "image")
//       return "IMG_";
//     else if (mimeType == "application")
//       return "IMG_";
//     else if (mimeType == "video")
//       return "VIDEO_";
//     else
//       return "OTHER_";
//   }

//   String _getCorrectType(String mimeType) {
//     switch (mimeType) {
//       case "audio":
//         return "aac";
//       case "image":
//         return "jpg";
//       case "video":
//         return "mp4";
//       case "application":
//         return "jpg";
//       default:
//         return mimeType;
//     }
//   }

//   Future<String> _getOrCreateFilesFolder(String mimeType) async {
//     String rootPath = await _getApplicationRootPath();
//     final Directory _appDirectoryFilesFolder =
//         Directory("$rootPath/${_getCorrectFolder(mimeType)}/");
//     if (await _appDirectoryFilesFolder.exists()) {
//       return _appDirectoryFilesFolder.path;
//     } else {
//       final Directory _appDocDirNewFolder =
//           await _appDirectoryFilesFolder.create(recursive: true);
//       return _appDocDirNewFolder.path;
//     }
//   }

//   Future<String> _getPath(File tmpFile) async {
//     String time = DateTime.now().microsecondsSinceEpoch.toString();
//     String? mimeStr = lookupMimeType(tmpFile.path);
//     var data = mimeStr?.split('/');
//     var fileDir = await _getOrCreateFilesFolder(data![0]);
//     var preName = _getIdentifyFileName(data[0]);
//     return fileDir + preName + time + '.' + data[1];
//   }

//   Future<File> saveFile(File tmpFile) async {
//     String path = await _getPath(tmpFile);
//     return File(path);
//   }

//   void readFile() async {
//     File file = File(await _getApplicationRootPath());
//     String fileContent = await file.readAsString();
//   }

//   String getExtension(File file) {
//     return file.path.split('.').last;
//   }

//   String getMediaType(String extention) {
//     switch (extention) {
//       case "mp3":
//         return "audio/mp3";
//       case "aac":
//         return "audio/aac";
//       case "m4a":
//         return "audio/mp3";
//       case "x-aac":
//         return "audio/aac";
//       case "mpeg":
//         return "audio/mpeg";
//       case "jpg":
//         return "image/jpeg";
//       case "jpeg":
//         return "image/jpeg";
//       case "mp4":
//         return "video/mp4";
//       case "png":
//         return "image/png";
//       default:
//         return "application/file";
//     }
//   }

//   String getSize(File file) {
//     /// return kilobyte
//     return double.parse((file.lengthSync() / 1024).toStringAsFixed(3))
//         .toString();
//   }
// }

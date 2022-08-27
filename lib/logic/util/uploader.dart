// import 'dart:async';
// import 'dart:collection';

// import 'dart:io';

// import 'package:http_parser/http_parser.dart' as f;
// import 'package:dio/dio.dart';

// import '../data/preferences/pref_key.dart';
// import 'file/file_helper.dart';

// class FileUploader {
//   /// managing uploadin files proccess in app lifetime
//   /// adding file future to list and return percent of uploading file in stream
//   ///

//   HashMap<File, Future<ApiWrapper<List<FileInfoDto>>>> filesFuture = HashMap();

//   HashMap<File, Stream<int>> filesStreamUploadPercent = HashMap();
//   late Dio _dio;

//   FileUploader({required Dio uploadDio}) {
//     this._dio = uploadDio;
//   }

//   Future<ApiWrapper<List<FileInfoDto>>> uploadFile(
//       File file, Function(int progress) progress) async {
//     try {
//       // create MultipartFile request
//       FormData _data = FormData.fromMap({
//         "files": MultipartFile.fromFileSync(file.path,
//             filename:
//                 "${DateTime.now().millisecondsSinceEpoch}.${FileHelper.getInstance.getExtension(file)}",
//             contentType: f.MediaType.parse(FileHelper.getInstance
//                 .getMediaType(FileHelper.getInstance.getExtension(file)))),
//       });

//       // uplaod file to server
//       var url = await Pref.get(key: PrefKey.WORKER_FILE_URL);
//       var result = await _dio.post(
//         url + "/v1/files",
//         data: _data,
//         onSendProgress: (count, total) {
//           progress != null ? progress((count * 100) ~/ total) : null;
//         },
//       );

//       // convert response to List<FileInfoDto>
//       List<FileInfoDto> tempData = List.generate(
//           result.data!.length == null ? 0 : result.data!.length,
//           (index) => FileInfoDto.fromJson(result.data![index])
//             ..name =
//                 "${DateTime.now().millisecondsSinceEpoch}.${FileHelper.getInstance.getExtension(file)}");

//       return ApiWrapper.success(data: tempData);
//     } catch (e) {
//       print('upload fialure');
//       return ApiWrapper.failure(error: NetworkExceptions.getDioException(e));
//     }
//   }

//   Stream<int> addFileToUpload(
//       {required File file,
//       required Function(ApiWrapper<List<FileInfoDto>>) onUploaded}) {
//     StreamController<int> controller = StreamController();

//     filesFuture[file] = uploadFile(file, (progress) {
//       controller.add(progress);
//     })
//       ..then((value) {
//         filesFuture.remove(file);
//         filesStreamUploadPercent.remove(file);

//         onUploaded(value);
//       }).onError((error, stackTrace) {
//         print('file uploading failure');
//         cancelFileUploading(file);
//       });

//     filesStreamUploadPercent[file] = controller.stream;

//     return controller.stream;
//   }

//   Stream<List<FileInfoDto>> addListFileToUpload(
//       {required List<File> files, Function()? onUploaded}) {
//     StreamController<List<FileInfoDto>> con =
//         StreamController<List<FileInfoDto>>();

//     files.forEach((file) {
//       Map<File, Stream<int>> stream = Map<File, Stream<int>>();
//       stream[file] = addFileToUpload(
//           file: file,
//           onUploaded: (result) {
//             result.when(
//                 success: (d) {
//                   con.sink.add(d);
//                 },
//                 failure: (d) {});
//           });
//     });

//     return con.stream;
//   }

//   // get list of  uploading files
//   HashMap<File, Future<ApiWrapper<List<FileInfoDto>>>>
//       get getUploadingFileList => filesFuture;

//   HashMap<File, Stream<int>> get getUploadPercentFiles =>
//       filesStreamUploadPercent;

//   // get file of uploading list
//   Future<ApiWrapper<List<FileInfoDto>>>? getFileUploadFuture(String messageId) {
//     return filesFuture[messageId];
//   }

//   cancelFileUploading(File file) {
//     try {
//       filesFuture[file]?.timeout(Duration(microseconds: 1));
//       filesFuture.remove(file);
//     } catch (e) {
//       filesFuture.remove(file);
//       return true;
//     }

//     filesStreamUploadPercent[file]?.listen((event) {}).cancel();
//     filesStreamUploadPercent.remove(file);
//   }

//   cancellAll() {
//     HashMap tempList = HashMap.from(filesFuture);

//     tempList.forEach((key, value) {
//       cancelFileUploading(key);
//     });
//   }
// }

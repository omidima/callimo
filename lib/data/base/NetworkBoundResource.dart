import 'dart:async';

import 'resource.dart';

class NetworkBoundResource<DatabaseModel, ResponseModel> {
  late StreamController<Resource<DatabaseModel>> _result =
      StreamController<Resource<DatabaseModel>>();
  late StreamSink<Resource<DatabaseModel>> _resultSink = _result.sink;

  Stream<Resource<DatabaseModel>> asStream({
    required Stream<DatabaseModel> loadFromDb,
    required bool shouldFetch(DatabaseModel data),
    bool cancelAfterResponse = false,
    required Future<ResponseModel> createCall(),
    required DatabaseModel processResponse(ResponseModel serverResponse),
    required Future<void> saveCallResult(DatabaseModel databaseData),
  }) {
    _result.addStream(loadFromDb.transform(
        StreamTransformer<DatabaseModel, Resource<DatabaseModel>>.fromHandlers(
            handleData: (event, sink) async {

              if (shouldFetch(event)) {

        sink.add(Resource.loading(data: event));
        shouldFetch = (DatabaseModel) => false;

        // try {
          // convert server call result for save to database
          var result = await _fetchFromNetwork(createCall, processResponse);
          await saveCallResult(result);
          sink.add(Resource.success(data: result));
        // } on Exception catch (e) {
        //   print("Fetching failed: ${e.toString()}");
        //   sink.addError(Resource.failed(data: null, error: e));
        // }
      } else {
        // send database model data to result
        sink.add(Resource.success(data: event));
      }
    })));

    return _result.stream;
  }

  Future<Resource<DatabaseModel>> asFuture({
    required Future<DatabaseModel?> loadFromDb,
    required bool shouldFetch(DatabaseModel data),
    required Future<ResponseModel> createCall(),
    required DatabaseModel processResponse(ResponseModel serverResponse),
    required Future<void> saveCallResult(DatabaseModel databaseData),
  }) async {
    try {
      var dbData = await loadFromDb;

      if (dbData == null || shouldFetch(dbData)) {
        var result = await _fetchFromNetwork(createCall, processResponse);
        try {
          // save to database
          await saveCallResult(result);
          return Resource.success(data: result);
        } on Exception catch (e) {
          return Resource.failed(data: null, error: e);
        }
      }

      return Resource.success(data: dbData);
    } on Exception catch (e) {
      return Resource.failed(error: Exception("cant load"));
    }
  }

  Future<Resource<ResponseModel>> asFutureNetwotk({
    required Future<ResponseModel> createCall(),
    DatabaseModel processResponse(ResponseModel serverResponse)?,
    Future<void> saveCallResult(DatabaseModel databaseData)?,
  }) async {
    try {
      var result;
      var databaseResult;
      if (processResponse != null) {
        result = await createCall();

        databaseResult = processResponse(result);
        try {
          // save to database
          if (saveCallResult != null) await saveCallResult(databaseResult);
            return Resource.success(data: await result);
        } on Exception catch (e) {
          return Resource.failed();
        }
      } else {
        result = await createCall();
      }

      try {
        // save to database
        return Resource.success(data: await result);
      } on Exception catch (e) {
        return Resource.failed();
      }
    } on Exception catch (e) {
      return Resource.failed();
    }
  }

  Future<DatabaseModel> _fetchFromNetwork(
      Future<ResponseModel> Function() createCall,
      DatabaseModel Function(ResponseModel result) pr) async {
    return createCall().then((value) async {
      return pr(value);
    });
  }
}

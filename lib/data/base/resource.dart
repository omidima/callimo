class Resource<T> {

  final ResourceStatus status;
  final T? data;
  final String? message;
  final Exception? error;

  const Resource({this.data, required this.status, this.message, this.error});

  static Resource<T> loading<T>({T? data}) =>
      Resource<T>(data: data, status: ResourceStatus.loading);

  static Resource<T> failed<T>({Exception? error, T? data}) => Resource<T>(
      error: error, data: data, status: ResourceStatus.failed);

  static Resource<T> success<T>({T? data}) =>
      Resource<T>(data: data, status: ResourceStatus.success);

}
enum ResourceStatus{
  loading, success, failed
}



class ResourceStreamListen<T> {

  ResourceStreamListen(Resource<T> data, {
    Function(T? items)? loading,
    required Function(T? items) success,
    Function(String? errorMessage,T? data)? failure}) {
      
    if (data.status == ResourceStatus.loading) {
      loading !=null ? loading(data.data) : null;
    }

    if (data.status == ResourceStatus.success) {
      success(data.data);
    }

    if (data.status == ResourceStatus.failed) {
      failure !=null ? failure(data.message, data.data) : null;
    }
  }
}
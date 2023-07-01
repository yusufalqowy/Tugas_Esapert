enum ResponseDataStatus{
  init,
  loading,
  success,
  error;
  bool get isSuccess => this == success;
  bool get isError => this == error;
}

class ResponseData<T>{
  final ResponseDataStatus status;
  final T? data;
  final String? message;
  const ResponseData({required this.status, this.data, this.message});

  static ResponseData<T> init<T>(){
    return ResponseData<T>(status: ResponseDataStatus.init);
  }

  static ResponseData<T> loading<T>(){
    return ResponseData<T>(status: ResponseDataStatus.loading);
  }

  static ResponseData<T> success<T>({required T data}){
    return ResponseData<T>(status: ResponseDataStatus.success, data: data);
  }
}

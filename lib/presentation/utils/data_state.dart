enum DataState {
  init,
  loading,
  success,
  error;

  bool get isSuccess => this == success;
}
/// This class would provide a more predictable means to
/// handle errors or success for API calls
/// Return `ServiceState.success` if call is successful
/// or, `ServiceState.error` with an error message and/or data. (use `ServerError` class)

class ServiceState<T> {
  ServiceState._(); // private constructor
  factory ServiceState.success(T value) = SuccessState<T>;

  factory ServiceState.error(T msg) = ErrorState<T>;
}

class ErrorState<T> extends ServiceState<T> {
  ErrorState(this.value) : super._();
  final T value;
}

class SuccessState<T> extends ServiceState<T> {
  SuccessState(this.value) : super._();
  final T value;
}
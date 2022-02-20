import 'package:wayve_test_app/core/api/service_state.dart';

class APIHelpers {
  APIHelpers._();

  static dynamic handleResponse(
      ServiceState response, {
        required Function(SuccessState) onSuccess,
        Function(ErrorState)? onError,
      }) {
    if (response is SuccessState) {
      onSuccess(response);
    } else if (response is ErrorState && onError != null) {
      onError(response);
    } else if (response is ErrorState) {
      //TODO: Setup default notification
    } else {
      //TODO: Setup default notification
    }
  }
}
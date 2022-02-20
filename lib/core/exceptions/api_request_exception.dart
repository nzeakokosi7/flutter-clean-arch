import 'app_exception.dart';

class ApiRequestException extends AppException {
  ApiRequestException([dynamic message])
      : super(message.toString(), "API Request Error");
}

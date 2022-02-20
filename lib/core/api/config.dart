import 'package:wayve_test_app/core/enums/environment.dart';
import 'package:wayve_test_app/core/utils/config_reader.dart';

class Config {
  Environment? envStatus;
  String? baseURL;

  Config() {

    if (envStatus == Environment.prod) {
      baseURL = ConfigReader.getProdUrl()!;
    } else {
      baseURL = ConfigReader.getDevUrl()!;
    }
  }
}
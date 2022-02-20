import 'package:wayve_test_app/core/enums/environment.dart';
import 'package:wayve_test_app/core/utils/config_reader.dart';

class Config {
  static Environment? envStatus;
  String? baseUrl;

  Config() {

    if (envStatus == Environment.prod) {
      baseUrl = ConfigReader.getProdUrl()!;
    } else {
      baseUrl = ConfigReader.getDevUrl()!;
    }
  }
}
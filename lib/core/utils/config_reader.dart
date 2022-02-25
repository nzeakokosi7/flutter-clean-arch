import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ConfigReader {
  static String? getDevUrl() {
    return dotenv.env['API_BASE_URL_DEV'];
  }

  static String? getProdUrl() {
    return dotenv.env['API_BASE_URL_PROD'];
  }
}

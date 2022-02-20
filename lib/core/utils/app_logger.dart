import 'package:logger/logger.dart';
import 'dart:developer' as developer;
import 'package:wayve_test_app/core/enums/environment.dart';
import 'package:wayve_test_app/main_common.dart';


class AppLogger {
  AppLogger._();
   static final Logger _logger = Logger();

  static void log(dynamic message, {
    bool longMessage = false,
  }){
    /// logger would only show logs in dev environment
    if(globalEnvironment != Environment.prod){
        if(longMessage){
          developer.log('$message');
        }else{
          _logger.i(message);
        }
      }
    }
}
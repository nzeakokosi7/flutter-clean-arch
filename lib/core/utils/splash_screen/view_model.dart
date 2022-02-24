import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wayve_test_app/core/ui/base/base_view_model.dart';
import 'package:wayve_test_app/core/ui/navigation/navigation.dart';
import 'package:wayve_test_app/core/utils/app_logger.dart';

class SplashScreenViewModel extends BaseViewModel {

  void init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    AppLogger.log("waiting");
    context.go(AppPages.userListScreen);
  }
}
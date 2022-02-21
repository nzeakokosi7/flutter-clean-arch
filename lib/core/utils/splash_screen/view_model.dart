import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/base/base_view_model.dart';
import 'package:wayve_test_app/core/ui/routing/app_routes.dart';
import 'package:wayve_test_app/core/utils/app_logger.dart';

class SplashScreenViewModel extends BaseViewModel {

  void init() async {
    await Future.delayed(const Duration(seconds: 1));
    AppLogger.log("waiting");
    try {
      var routSettings =  const RouteSettings(name: AppRoutes.userListScreen);
      navigationService.navigate(appContext, routSettings);
    }catch(e) {
      AppLogger.log(e.toString());
    }
  }
}
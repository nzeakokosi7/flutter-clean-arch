import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/base/base_view_model.dart';
import 'package:wayve_test_app/core/ui/routing/app_routes.dart';
import 'package:wayve_test_app/core/utils/app_logger.dart';

import '../../../di.dart';
import '../../ui/_navigation/router_delegate.dart';

class SplashScreenViewModel extends BaseViewModel {
  var appDelegate = locator<AppRouterDelegate>();

  void init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    AppLogger.log("waiting");
    try {
      appDelegate.goTo(name: AppRoutes.userListScreen);
    }catch(e) {
      AppLogger.log(e.toString());
    }
  }
}
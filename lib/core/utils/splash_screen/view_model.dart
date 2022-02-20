import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/base/base_view_model.dart';

class SplashScreenViewModel extends BaseViewModel {

  void init() async {
    await Future.delayed(const Duration(milliseconds: 300));
    var routSettings = const RouteSettings(name: "/home");
    navigationService.navigate(routSettings);
  }
}
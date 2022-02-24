import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:wayve_test_app/core/ui/navigation/navigation.dart';

import '../../di.dart';

extension Responsivity on BuildContext {
  double ofHeight(double height) => MediaQuery.of(this).size.height * height;
  double ofWidth(double width) => MediaQuery.of(this).size.height * width;
}
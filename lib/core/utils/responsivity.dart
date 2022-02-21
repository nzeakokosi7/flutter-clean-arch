import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:wayve_test_app/core/ui/navigation/navigation.dart';

import '../../di.dart';

extension HeightExtension on double {
  double get ofHeight => MediaQuery.of(context).size.height * this;

  double get ofWidth => MediaQuery.of(context).size.width * this;
}

BuildContext get context {
  var nav = locator<NavigationService>();
  BuildContext? ctx = nav.navigatorKey.currentContext;
  if (ctx == null) throw "couldn't find context";
  return ctx;
}
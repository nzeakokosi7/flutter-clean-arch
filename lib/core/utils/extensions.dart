import 'package:flutter/cupertino.dart';

extension Responsivity on BuildContext {
  double ofHeight(double height) => MediaQuery.of(this).size.height * height;
  double ofWidth(double width) => MediaQuery.of(this).size.height * width;
}

import 'package:flutter/cupertino.dart';

import 'colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle bigTextStyle = TextStyle(
    color: AppColors.titleColor,
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle titleTextStyle = TextStyle(
    color: AppColors.titleColor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle itemTitleTextStyle = TextStyle(
    color: AppColors.titleColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle groupTitleTextStyle = TextStyle(
    color: AppColors.titleColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle avatarDenseTitleTextStyle = TextStyle(
    color: AppColors.titleColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle subTitleTextStyle = TextStyle(
    color: AppColors.subTitleColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}

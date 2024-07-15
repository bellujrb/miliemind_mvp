import 'package:flutter/material.dart';
import 'package:miliemind_mvp/core/style/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static AppTextStyles? _instance;

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get smallWhite => TextStyle(
      color: AppColors.tertiary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  TextStyle get smallGray => TextStyle(
      color: AppColors.gray,
      fontSize: 16,
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.none);

  TextStyle get smallBlack => TextStyle(
      color: AppColors.onTertiary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  TextStyle get mediumBlack => TextStyle(
      color: AppColors.onTertiary,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  TextStyle get bigBlack => TextStyle(
      color: AppColors.onTertiary,
      fontSize: 32,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}

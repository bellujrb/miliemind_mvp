import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static AppColors? _instance;

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  static Color get primary => const Color(0xFFFA759E);
  static Color get tertiary => const Color(0xFFFFFFFF);
  static Color get onTertiary => const Color(0xFF000000);

  static Color get background => const Color(0xFFF3F4F6);
  static Color get gray => const Color(0xFF5F6980);
}

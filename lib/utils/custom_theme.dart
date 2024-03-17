import 'package:chat_gpt_app/utils/app_cons.dart';
import 'package:flutter/material.dart';

ThemeData customAppTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        color: AppColors.hintTextColor,
        fontSize: AppColors.hintTextSize,
      ),
      titleMedium: const TextStyle(
        color: AppColors.titleTextColor,
        fontSize: AppColors.titleTextSize,
      ),
    ),
    useMaterial3: true,
  );
}

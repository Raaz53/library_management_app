import 'package:flutter/material.dart';

import '../app_theme/app_colors.dart';

class AppStyles {
  AppStyles._();

  static OutlineInputBorder outlinedInputBorder(
          {bool hasValidationError = false,
          bool hasMandatoryBorder = false,
          Color borderColor = AppColors.transparent,
          double borderRadius = 16.0}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
            width: hasMandatoryBorder ? 1.0 : (hasValidationError ? 1.0 : 0.0),
            color: hasValidationError ? AppColors.red : borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      );

  static OutlineInputBorder textViewBorder() => OutlineInputBorder(
        borderSide: const BorderSide(width: 0, color: AppColors.transparent),
        borderRadius: BorderRadius.circular(0),
      );

  static BorderSide borderSide() =>
      BorderSide(color: AppColors.color717171, width: 0.5);
  static Border verticalAppBorder() => Border(
      top: BorderSide(color: AppColors.color717171, width: 0.5),
      bottom: BorderSide(color: AppColors.color717171, width: 0.5));
  static Border bottomAppBorder() =>
      Border(bottom: BorderSide(color: AppColors.color717171, width: 0.5));
}

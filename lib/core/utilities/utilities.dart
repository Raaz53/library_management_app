import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';

class Utilities {
  Utilities._();

  static OverlayEntry? _currentOverlay;

  static void showSnackBar(BuildContext context, String message,
      {bool isError = false}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: AppTextStyles.bodyExtraSmallInter
            .copyWith(color: isError ? AppColors.white : AppColors.black),
      ),
      backgroundColor: isError
          ? AppColors.red.withValues(alpha: 0.8)
          : AppColors.lightGray.withValues(alpha: 0.8),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showCustomDialog({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = false, // Default: Prevent dismissing
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: child, // Custom widget passed here
        );
      },
    );
  }

  static void removePopupMenu() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }
}

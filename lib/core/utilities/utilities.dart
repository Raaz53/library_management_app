import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_text_styles.dart';

class Utilities {
  Utilities._();

  static OverlayEntry? _currentOverlay;

  static void showCustomSnackbar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    removePopupMenu();

    final overlayState = Overlay.of(context);
    if (overlayState == null) return;
    // If there's an existing overlay, remove it
    if (_currentOverlay != null) return;
    // Create an OverlayEntry
    _currentOverlay = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
        child: Material(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(message,
                    style: AppTextStyles.bodyExtraSmallMonserat
                        .copyWith(color: Colors.red.withValues(alpha: 0.5))),
              ),
            ),
          ),
        ),
      ),
    );
    overlayState.insert(_currentOverlay!);

    Future.delayed(duration, () {
      removePopupMenu();
    });
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

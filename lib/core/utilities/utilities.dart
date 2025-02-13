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
    // If there's an existing overlay, remove it
    if (_currentOverlay != null) return;
    // Create an OverlayEntry
    _currentOverlay = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 10.0, // Margin from the bottom
        left: 10.0, // Margin from the left
        right: 10.0, // Margin from the right
        child: Material(
          color: Colors.transparent, // Transparent background
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.black
                      .withValues(alpha: 0.5), // Semi-transparent black color
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(message,
                    style: AppTextStyles.bodyExtraSmallMonserat
                        .copyWith(color: Colors.white.withValues(alpha: 0.5))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

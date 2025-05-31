import 'package:flutter/material.dart';

import '../app_theme/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.title,
    required this.onClick,
    this.backgroundColor = AppColors.lightBlack,
    this.disableTitle = false,
    this.textColor = Colors.white,
    this.height = 46.0,
    this.radius = 10.0,
    this.elevation = 0.0,
    this.fontSize = 16.0,
    this.width,
    this.border,
    this.padding,
    this.icon,
    this.hasUnderline = false,
    this.hasGradientBorder = false,
    this.hasGradientBackground = false,
    this.addIconAfterText = false,
    this.titleStyle,
    super.key,
  });

  final String title;
  final bool disableTitle;
  final VoidCallback? onClick;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double? width;
  final double radius;
  final double elevation;
  final double fontSize;
  final BorderSide? border;
  final Widget? icon;
  final EdgeInsets? padding;
  final bool hasUnderline;
  final bool hasGradientBorder;
  final bool hasGradientBackground;
  final bool addIconAfterText;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClick,
      elevation: elevation,
      height: height,
      splashColor: AppColors.transparent,
      minWidth: width ?? double.infinity,
      color: hasGradientBackground ? null : backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: border ?? BorderSide.none,
      ),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && !addIconAfterText) ...[
            icon!,
            const SizedBox(width: 8),
          ],
          Text(
            title,
            style: titleStyle ??
                TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                  decoration: hasUnderline
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
          ),
          if (icon != null && addIconAfterText) ...[
            const SizedBox(width: 8),
            icon!,
          ],
        ],
      ),
    );
  }
}

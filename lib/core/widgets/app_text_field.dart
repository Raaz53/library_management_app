import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../app_theme/app_colors.dart';
import '../utilities/app_styles.dart';

class AppTextField {
  AppTextField._();

  static Widget textField(
      {required BuildContext context,
      Key? key,
      String? Function(String)? validator,
      required String name,
      TextStyle? style,
      bool? autocorrect,
      TextEditingController? textEditingController,
      String? hint,
      Color? backgroundColor = AppColors.white,
      Function(String?)? onTextChanged,
      Function(String?)? onFieldSubmitted,
      Function()? onTap,
      TextInputType keyboardType = TextInputType.text,
      TextInputAction textInputAction = TextInputAction.done,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      Function? onObscureTapped,
      bool isPasswordField = false,
      bool isObscured = false,
      bool disablesEmojis = true,
      bool readOnly = false,
      int? maxLines = 1,
      int? maxLength,
      double verticalPadding = 5,
      bool isDisabled = false,
      bool isRequired = false,
      List<TextInputFormatter>? inputFormatters,
      String? headerTitle,
      Widget? suffixIcon,
      Widget? prefixIcon,
      FocusNode? focusNode,
      TextStyle? headerStyle,
      TextStyle? hintStyle,
      double borderRadius = 50.0,
      Color? textColor,
      bool hasError = false,
      String? initialValue,
      bool isTextFieldOnly = true,
      book}) {
    final formatters = <TextInputFormatter>[];
    if (disablesEmojis) {
      formatters.add(FilteringTextInputFormatter.deny(RegExp('''
(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])''')));
    }
    inputFormatters?.forEach(formatters.add);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isTextFieldOnly)
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    headerTitle ?? '',
                    style: headerStyle ?? AppTextStyles.bodyMediumMonserat,
                  ),
                ),
                isRequired
                    ? Text(
                        '*',
                        style: TextStyle(color: AppColors.error),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        FormBuilderTextField(
          key: key,
          name: name,
          initialValue: initialValue,
          controller: textEditingController,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          maxLines: maxLines,
          style: style,
          validator: (value) => validator?.call(value ?? ''),
          onChanged: onTextChanged,
          focusNode: focusNode,
          obscureText: isObscured,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onSubmitted: onFieldSubmitted,
          textCapitalization: textCapitalization,
          autocorrect: autocorrect ?? false,
          onTap: onTap,
          maxLength: maxLength,
          readOnly: isDisabled,
          inputFormatters: formatters,
          decoration: InputDecoration(
            fillColor: backgroundColor ?? AppColors.buttonSecondary,
            contentPadding:
                const EdgeInsets.only(left: 20, top: 16, bottom: 16),
            filled: true,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: (hint ?? ''),
            alignLabelWithHint: true,
            hintStyle: hintStyle,
            border: AppStyles.outlinedInputBorder(
                hasValidationError: hasError, borderRadius: borderRadius),
            enabledBorder: AppStyles.outlinedInputBorder(
                hasValidationError: hasError, borderRadius: borderRadius),
            focusedBorder: AppStyles.outlinedInputBorder(
                hasValidationError: hasError, borderRadius: borderRadius),
          ),
        ),
      ],
    );
  }

  static Widget dropdownField<T>({
    required BuildContext context,
    required String name,
    required List<T> items,
    String? Function(T?)? validator,
    Function(T?)? onChanged,
    T? initialValue,
    bool isDisabled = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hint,
    TextStyle? hintStyle,
    Color? backgroundColor = AppColors.white,
    double borderRadius = 50.0,
    bool hasError = false,
    TextStyle? textStyle,
    bool disablesEmojis = true,
    List<TextInputFormatter>? inputFormatters,
    bool isTextFieldOnly = true,
    String? headerTitle,
    TextStyle? headerStyle,
    bool isRequired = false,
    Color? dropdownColor,
    Widget? child,
  }) {
    final formatters = <TextInputFormatter>[];
    if (disablesEmojis) {
      formatters.add(FilteringTextInputFormatter.deny(RegExp('''
(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])''')));
    }
    inputFormatters?.forEach(formatters.add);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isTextFieldOnly)
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    headerTitle ?? '',
                    style: headerStyle ?? AppTextStyles.bodySmallMonserat,
                  ),
                ),
                isRequired
                    ? Text(
                        '*',
                        style: TextStyle(color: AppColors.error),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        FormBuilderDropdown<T>(
          name: name,
          initialValue: initialValue,
          onChanged: isDisabled ? null : onChanged,
          validator: validator,
          style: textStyle,
          dropdownColor: dropdownColor ?? Colors.black,
          decoration: InputDecoration(
            fillColor: isDisabled ? Colors.grey.shade300 : backgroundColor,
            filled: true,
            contentPadding:
                const EdgeInsets.only(left: 20, top: 16, bottom: 16),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hint,
            hintStyle: hintStyle,
            alignLabelWithHint: true,
            border: AppStyles.outlinedInputBorder(
                hasValidationError: hasError, borderRadius: borderRadius),
            enabledBorder: AppStyles.outlinedInputBorder(
                hasValidationError: hasError, borderRadius: borderRadius),
            focusedBorder: AppStyles.outlinedInputBorder(
                hasValidationError: hasError, borderRadius: borderRadius),
          ),
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: child ?? Text(item.toString()), // Customize if needed
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

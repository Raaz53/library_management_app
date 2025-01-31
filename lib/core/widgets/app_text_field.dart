import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../app_theme/app_colors.dart';
import '../utilities/app_styles.dart';

class AppTextField {
  AppTextField._();

  static Widget textField({
    required BuildContext context,
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
    int maxLength = 255,
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
                    style: headerStyle,
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
          readOnly: isDisabled,
          inputFormatters: formatters,
          decoration: InputDecoration(
            fillColor:
                isDisabled ? AppColors.lightGray : AppColors.buttonSecondary,
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
}

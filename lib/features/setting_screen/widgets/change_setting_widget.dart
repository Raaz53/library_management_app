import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:flutter/material.dart';

class ChangeSettingWidget extends StatelessWidget {
  const ChangeSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: AppColors.black,
      child: Column(
        children: [
          contentWidget(title: 'Change password', onPressed: () {}),
          Divider(
            color: Colors.grey,
          ),
          contentWidget(title: 'Change bio', onPressed: () {}),
          Divider(
            color: Colors.grey,
          ),
          contentWidget(
              title: 'Delete account', onPressed: () {}, isDelete: true),
        ],
      ),
    );
  }

  Widget contentWidget(
      {String? title, VoidCallback? onPressed, bool isDelete = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: AppTextStyles.bodyMediumPoppins.copyWith(
            color: isDelete ? Colors.red : Colors.white,
          ),
        ),
        8.horizontalBox,
        Icon(Icons.arrow_forward_ios,
            color: isDelete ? Colors.red : Colors.white),
      ],
    );
  }
}

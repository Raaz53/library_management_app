import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:flutter/material.dart';

class ProfileRewardWidget extends StatelessWidget {
  const ProfileRewardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            ImageAssets.profileImg,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        10.verticalBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            90.horizontalBox,
            Text(
              'John Doe',
              style: AppTextStyles.bodyMediumPoppins,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.badge_rounded,
                  color: Colors.red,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '100.0',
                      style: AppTextStyles.bodyExtraSmallInter,
                    ),
                    Text(
                      'Reward points',
                      style: AppTextStyles.bodyExtraSmallInter
                          .copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

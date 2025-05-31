import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/routes/routes.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:flutter/material.dart';

class ProfileRewardWidget extends StatelessWidget {
  const ProfileRewardWidget({super.key, this.userName, this.rewardPoints});
  final String? userName;
  final double? rewardPoints;

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
              userName ?? 'John Doe',
              style: AppTextStyles.bodyMediumPoppins,
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                context.router.push(RewardAddOn(
                    currentPoints: rewardPoints ?? 0, userName: userName));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.badge_rounded,
                    color: Colors.red,
                  ),
                  5.horizontalBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (globalUserRole == UserRole.user)
                        Text(
                          rewardPoints?.toString() ?? '0',
                          style: AppTextStyles.bodyExtraSmallInter,
                        ),
                      Text(
                        globalUserRole == UserRole.user
                            ? 'Reward points'
                            : 'Rewards',
                        style: AppTextStyles.bodyExtraSmallInter
                            .copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                  5.horizontalBox,
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

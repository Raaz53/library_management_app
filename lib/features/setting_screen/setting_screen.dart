import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/features/setting_screen/widgets/change_setting_widget.dart';
import 'package:book_hive/features/setting_screen/widgets/detail_info_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_reward_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key, this.userModel});
  final UserModel? userModel;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late UserModel? userData;

  @override
  void initState() {
    super.initState();

    userData = widget.userModel;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        10.verticalBox,
        ProfileRewardWidget(
          userName: userData?.name ?? '',
          rewardPoints: userData?.rewardPoints ?? 0.0,
        ),
        20.verticalBox,
        DetailInfoWidget(
          email: userData?.email ?? '',
          bio: userData?.bio ?? '',
        ),
        20.verticalBox,
        ChangeSettingWidget(),
      ],
    );
  }
}

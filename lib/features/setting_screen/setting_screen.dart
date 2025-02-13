import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/features/setting_screen/widgets/change_setting_widget.dart';
import 'package:book_hive/features/setting_screen/widgets/detail_info_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_reward_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        10.verticalBox,
        ProfileRewardWidget(),
        20.verticalBox,
        DetailInfoWidget(),
        20.verticalBox,
        ChangeSettingWidget(),
      ],
    );
  }
}

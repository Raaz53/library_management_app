import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/features/setting_screen/widgets/change_setting_widget.dart';
import 'package:book_hive/features/setting_screen/widgets/detail_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/get_user_profile_cubit.dart';
import 'widgets/profile_reward_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late GetUserProfileCubit _getUserProfileCubit;

  @override
  void initState() {
    super.initState();
    _getUserProfileCubit = context.read<GetUserProfileCubit>();
    _getUserProfileCubit.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
      bloc: _getUserProfileCubit,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.shrink,
          loading: () => Center(child: CircularProgressIndicator.adaptive()),
          error: (message) => Center(
            child: Text('Error fetching user data',
                style: AppTextStyles.bodyExtraSmallInter),
          ),
          success: (userData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                10.verticalBox,
                ProfileRewardWidget(
                  userName: userData.name,
                  rewardPoints: userData.rewardPoints,
                ),
                20.verticalBox,
                DetailInfoWidget(
                  email: userData.email,
                  bio: userData.bio,
                ),
                20.verticalBox,
                ChangeSettingWidget(),
              ],
            );
          },
        );
      },
    );
  }
}

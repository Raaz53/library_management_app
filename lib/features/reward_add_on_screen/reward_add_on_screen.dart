import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/models/rewards_model/reward_model.dart';
import 'package:book_hive/core/routes/routes.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:book_hive/core/utilities/utilities.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:book_hive/features/reward_add_on_screen/cubit/get_rewards_cubit/get_rewards_cubit.dart';
import 'package:book_hive/features/reward_add_on_screen/widget/admin_reward_grant_widget.dart';
import 'package:book_hive/features/reward_add_on_screen/widget/single_reward_item_widget.dart';
import 'package:book_hive/features/setting_screen/cubit/get_user_profile_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_theme/app_colors.dart';
import '../dashboard_page/widgets/cutom_app_bar.dart';
import 'cubit/reward_claim_cubit/user_claim_reward_cubit.dart';

@RoutePage(name: 'RewardAddOn')
class RewardAddOnScreen extends StatefulWidget {
  final double? currentPoints;
  final String? userName;

  const RewardAddOnScreen({super.key, this.currentPoints, this.userName});

  @override
  State<RewardAddOnScreen> createState() => _RewardAddOnScreenState();
}

class _RewardAddOnScreenState extends State<RewardAddOnScreen> {
  late GetRewardsCubit _getRewardsCubit;
  late UserClaimRewardCubit _userClaimRewardCubit;

  @override
  void initState() {
    _getRewardsCubit = Injector.instance<GetRewardsCubit>();
    _getRewardsCubit.getRewards();
    _userClaimRewardCubit = Injector.instance<UserClaimRewardCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'Rewards',
        leading: SizedBox(
          height: 50,
          width: 50,
          child: BackButton(
            color: AppColors.white,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      backgroundColor: AppColors.primaryDark,
      body: BlocListener<UserClaimRewardCubit, UserClaimRewardState>(
        bloc: _userClaimRewardCubit,
        listener: (context, state) {
          state.maybeWhen(
            loading: () {
              Utilities.showCustomLoading(context: context);
            },
            success: () {
              _getRewardsCubit;
              context.read<GetUserProfileCubit>().getUserProfile();
              return context.router
                  .popUntil((route) => route.settings.name == Dashboard.name);
            },
            error: (_) => Navigator.pop(context),
            orElse: () {},
          );
        },
        child: BlocBuilder<GetRewardsCubit, GetRewardsState>(
          bloc: _getRewardsCubit,
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Center(child: CircularProgressIndicator()),
              success: (rewards) {
                return GridView.builder(
                  itemCount: rewards?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.6),
                  itemBuilder: (context, index) {
                    final RewardModel? reward = rewards?[index];
                    return SingleRewardItemWidget(
                      rewardName: reward?.name,
                      rewardPoints: reward?.pointsRequired,
                      currentPoints: widget.currentPoints,
                      rewardId: reward?.id,
                      rewardDescription: reward?.description,
                      rewardImage: reward?.imageUrl,
                      onTap: () => globalUserRole == UserRole.user
                          ? _userRewardClaim(reward)
                          : _adminRewardGrant(reward),
                    );
                  },
                );
              },
              orElse: SizedBox.new,
            );
          },
        ),
      ),
    );
  }

  _userRewardClaim(RewardModel? reward) {
    if ((widget.currentPoints ?? 0) >= (reward?.pointsRequired ?? 0) && true) {
      Utilities.showCustomDialog(
        context: context,
        barrierDismissible: true,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Redeem ${reward?.name}',
                style: AppTextStyles.bodyMediumMonserat.copyWith(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Are you sure you want to redeem this reward?',
                style: TextStyle(
                  color: AppColors.white.withValues(alpha: 0.8),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              AppButton(
                title: 'Redeem',
                backgroundColor: AppColors.white,
                titleStyle: AppTextStyles.bodyMediumMonserat.copyWith(
                    color: AppColors.primaryDark, fontWeight: FontWeight.w600),
                onClick: () {
                  final rewardClaim = RewardClaim(
                      userId: FirebaseAuth.instance.currentUser?.uid ?? '',
                      userName: widget.userName,
                      rewardPoints: reward?.pointsRequired ?? 0,
                      claimStatus: RewardStatus.pending);
                  _userClaimRewardCubit.claimReward(
                    reward?.id,
                    rewardClaim,
                  );
                },
              )
            ],
          ),
        ),
      );
    }
  }

  _adminRewardGrant(RewardModel? reward) {
    Utilities.showCustomDialog(
      context: context,
      barrierDismissible: true,
      child: AdminRewardGrantWidget(
        rewardModel: reward,
      ),
    );
  }
}

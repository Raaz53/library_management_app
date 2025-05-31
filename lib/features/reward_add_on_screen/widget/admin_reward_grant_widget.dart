import 'dart:developer';

import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/models/rewards_model/reward_model.dart';
import 'package:book_hive/core/utilities/utilities.dart';
import 'package:book_hive/features/reward_add_on_screen/cubit/grant_reward_cubit/grant_reward_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/utilities/app_text_styles.dart';
import '../../../core/widgets/app_button_widget.dart';
import '../cubit/get_reward_claimer_cubit/get_reward_claimer_cubit.dart';

class AdminRewardGrantWidget extends StatefulWidget {
  const AdminRewardGrantWidget({super.key, this.rewardModel});

  final RewardModel? rewardModel;

  @override
  State<AdminRewardGrantWidget> createState() => _AdminRewardGrantWidgetState();
}

class _AdminRewardGrantWidgetState extends State<AdminRewardGrantWidget> {
  late RewardModel? reward;
  late final GetRewardClaimerCubit _getRewardClaimerCubit;
  late final GrantRewardCubit _grantRewardCubit;

  @override
  void initState() {
    super.initState();
    _getRewardClaimerCubit = Injector.instance<GetRewardClaimerCubit>();
    _grantRewardCubit = Injector.instance<GrantRewardCubit>();
    reward = widget.rewardModel;
    _getRewardClaimerCubit.getRewardClaimer(reward?.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GrantRewardCubit, GrantRewardState>(
      bloc: _grantRewardCubit,
      listener: (context, state) {
        state.maybeWhen(loading: () {
          Utilities.showCustomLoading(context: context);
        }, grant: () {
          log('granted reward');
          Navigator.of(context, rootNavigator: true).pop();
        }, reject: () {
          log('rejected reward');
          Navigator.of(context, rootNavigator: true).pop();
        }, orElse: () {
          log('went to or else');
        });
      },
      child: BlocBuilder<GetRewardClaimerCubit, GetRewardClaimerState>(
        bloc: _getRewardClaimerCubit,
        builder: (context, state) {
          return state.maybeWhen(
              loading: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Utilities.showCustomLoading(context: context);
                });
                return SizedBox.shrink();
              },
              success: (rewardClaimers) {
                Navigator.of(context, rootNavigator: true).pop();
                log('number of claimers are: ${rewardClaimers?.length}');
                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Grant ${reward?.name}',
                        style: AppTextStyles.bodyMediumMonserat.copyWith(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Requested IDs',
                        style: AppTextStyles.bodyMediumMonserat.copyWith(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        color: AppColors.white,
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                            itemCount: rewardClaimers?.length ?? 0,
                            itemBuilder: (context, index) {
                              final claimer = rewardClaimers?[index];
                              return Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    claimer?.userId ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodyMediumPoppins,
                                  )),
                                  CustomIconButton(
                                    onClick: () {
                                      log('here the reward is ${reward?.id} and claim is ${claimer?.rid} and user is ${claimer?.userId}');
                                      _grantRewardCubit.grantReward(
                                          reward?.id, claimer?.rid);
                                    },
                                    color: AppColors.green,
                                    icon: Icon(Icons.check,
                                        color: AppColors.black),
                                  ),
                                  CustomIconButton(
                                    onClick: () {
                                      _grantRewardCubit.rejectReward(
                                          reward?.id,
                                          claimer?.rid,
                                          claimer?.userId,
                                          reward?.pointsRequired);
                                    },
                                    color: AppColors.red,
                                    icon: Icon(Icons.close,
                                        color: AppColors.black),
                                  ),
                                ],
                              );
                            }),
                      ),
                      SizedBox(height: 20),
                      AppButton(
                        title: 'Done',
                        backgroundColor: AppColors.white,
                        titleStyle: AppTextStyles.bodyMediumMonserat.copyWith(
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.w600),
                        onClick: () {},
                      )
                    ],
                  ),
                );
              },
              orElse: SizedBox.new);
        },
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.onClick, this.color, this.icon});

  final VoidCallback? onClick;
  final Color? color;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryDark,
          borderRadius: BorderRadius.circular(5),
        ),
        child: icon,
      ),
    );
  }
}

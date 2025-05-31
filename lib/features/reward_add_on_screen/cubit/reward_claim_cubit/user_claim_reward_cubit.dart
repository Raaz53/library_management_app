import 'package:book_hive/core/models/rewards_model/reward_model.dart';
import 'package:book_hive/core/services/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_claim_reward_cubit.freezed.dart';
part 'user_claim_reward_state.dart';

class UserClaimRewardCubit extends Cubit<UserClaimRewardState> {
  UserClaimRewardCubit() : super(const UserClaimRewardState.initial());

  Future<void> claimReward(String? rewardId, RewardClaim? rewardClaim) async {
    emit(const UserClaimRewardState.loading());
    try {
      await AuthService.claimReward(rewardId, rewardClaim);
      emit(const UserClaimRewardState.success());
    } catch (e) {
      emit(UserClaimRewardState.error(e.toString()));
    }
  }
}

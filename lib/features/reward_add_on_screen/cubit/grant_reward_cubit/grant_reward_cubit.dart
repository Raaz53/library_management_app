import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/auth_services.dart';

part 'grant_reward_cubit.freezed.dart';
part 'grant_reward_state.dart';

class GrantRewardCubit extends Cubit<GrantRewardState> {
  GrantRewardCubit() : super(const GrantRewardState.initial());

  Future<void> grantReward(String? rewardId, String? claimerId) async {
    emit(const GrantRewardState.loading());
    try {
      // Simulate granting a reward to a user
      await AuthService.grantRewardClaim(
          rewardId, claimerId); // Simulate network delay
      emit(const GrantRewardState.grant());
    } catch (e) {
      emit(GrantRewardState.error(e.toString()));
    }
  }

  Future<void> rejectReward(String? rewardId, String? claimerId, String? uid,
      double? rewardPoint) async {
    emit(const GrantRewardState.loading());
    try {
      await AuthService.rejectRewardClaim(
          rewardId, claimerId, uid, rewardPoint); // Simulate network delay
      emit(const GrantRewardState.reject());
    } catch (e) {
      emit(GrantRewardState.error(e.toString()));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/rewards_model/reward_model.dart';
import '../../../../core/services/auth_services.dart';

part 'get_reward_claimer_cubit.freezed.dart';
part 'get_reward_claimer_state.dart';

class GetRewardClaimerCubit extends Cubit<GetRewardClaimerState> {
  GetRewardClaimerCubit() : super(const GetRewardClaimerState.initial());

  Future<void> getRewardClaimer(String? rewardId) async {
    emit(const GetRewardClaimerState.loading());
    try {
      // Simulate fetching claimer users from a repository or service
      final List<RewardClaim>? claimerUsers =
          await AuthService.getRewardClaimById(rewardId);
      emit(GetRewardClaimerState.success(claimerUsers));
    } catch (e) {
      emit(GetRewardClaimerState.error(e.toString()));
    }
  }
}

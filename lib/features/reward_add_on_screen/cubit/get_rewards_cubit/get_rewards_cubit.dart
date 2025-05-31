import 'package:book_hive/core/services/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/rewards_model/reward_model.dart';

part 'get_rewards_cubit.freezed.dart';
part 'get_rewards_state.dart';

class GetRewardsCubit extends Cubit<GetRewardsState> {
  GetRewardsCubit() : super(const GetRewardsState.initial());

  Future<void> getRewards() async {
    emit(const GetRewardsState.loading());
    try {
      // Simulate fetching rewards from a repository or service
      final List<RewardModel>? rewards = await AuthService.getRewards();
      emit(GetRewardsState.success(rewards));
    } catch (e) {
      emit(GetRewardsState.error(e.toString()));
    }
  }
}

part of 'get_rewards_cubit.dart';

@freezed
class GetRewardsState with _$GetRewardsState {
  const factory GetRewardsState.initial() = _Initial;
  const factory GetRewardsState.loading() = _Loading;
  const factory GetRewardsState.success(List<RewardModel>? rewards) = _Success;
  const factory GetRewardsState.error(String error) = _Error;
}

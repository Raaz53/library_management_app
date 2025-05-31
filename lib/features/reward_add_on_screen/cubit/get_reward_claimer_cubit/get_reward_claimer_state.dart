part of 'get_reward_claimer_cubit.dart';

@freezed
class GetRewardClaimerState with _$GetRewardClaimerState {
  const factory GetRewardClaimerState.initial() = _Initial;
  const factory GetRewardClaimerState.loading() = _Loading;
  const factory GetRewardClaimerState.success(List<RewardClaim>? claimerUsers) =
      _Success;
  const factory GetRewardClaimerState.error(String? message) = _Error;
}

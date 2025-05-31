part of 'user_claim_reward_cubit.dart';

@freezed
class UserClaimRewardState with _$UserClaimRewardState {
  const factory UserClaimRewardState.initial() = _Initial;
  const factory UserClaimRewardState.loading() = _Loading;
  const factory UserClaimRewardState.success() = _Success;
  const factory UserClaimRewardState.error(String? message) = _Error;
}

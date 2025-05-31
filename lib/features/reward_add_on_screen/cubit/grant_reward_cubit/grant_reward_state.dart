part of 'grant_reward_cubit.dart';

@freezed
class GrantRewardState with _$GrantRewardState {
  const factory GrantRewardState.initial() = _Initial;
  const factory GrantRewardState.loading() = _Loading;
  const factory GrantRewardState.grant() = _Grant;
  const factory GrantRewardState.reject() = _Reject;
  const factory GrantRewardState.error(String? message) = _Error;
}

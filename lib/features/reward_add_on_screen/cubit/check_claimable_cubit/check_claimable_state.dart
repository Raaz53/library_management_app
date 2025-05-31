part of 'check_claimable_cubit.dart';

@freezed
class CheckClaimableState with _$CheckClaimableState {
  const factory CheckClaimableState.initial() = _Initial;
  const factory CheckClaimableState.loading() = _Loading;
  const factory CheckClaimableState.success(bool? claimable) = _Success;
  const factory CheckClaimableState.error(String? message) = _Error;
}

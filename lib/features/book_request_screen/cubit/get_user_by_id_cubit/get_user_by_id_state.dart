part of 'get_user_by_id_cubit.dart';

@freezed
class GetUserByIdState with _$GetUserByIdState {
  const factory GetUserByIdState.initial() = _Initial;
  const factory GetUserByIdState.loading() = _Loading;
  const factory GetUserByIdState.success(UserModel? user) = _Success;
  const factory GetUserByIdState.error(String? message) = _Error;
}

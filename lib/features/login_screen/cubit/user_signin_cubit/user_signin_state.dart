part of 'user_signin_cubit.dart';

@freezed
class UserSignInState with _$UserSignInState {
  const factory UserSignInState.initial() = _Initial;
  const factory UserSignInState.loading() = _Loading;
  const factory UserSignInState.success({required String message}) = _Success;
  const factory UserSignInState.error({required String error}) = _Error;
}

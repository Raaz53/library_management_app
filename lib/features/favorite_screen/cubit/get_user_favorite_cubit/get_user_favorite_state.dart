part of 'get_user_favorite_cubit.dart';

@freezed
class GetUserFavoriteState with _$GetUserFavoriteState {
  const factory GetUserFavoriteState.initial() = _Initial;
  const factory GetUserFavoriteState.loading() = _Loading;
  const factory GetUserFavoriteState.success(
      List<FireBookModel>? favoriteBooks) = _Success;
  const factory GetUserFavoriteState.error(String? message) = _Error;
}

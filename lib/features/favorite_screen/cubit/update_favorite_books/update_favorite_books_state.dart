part of 'update_favorite_books_cubit.dart';

@freezed
class UpdateFavoriteBooksState with _$UpdateFavoriteBooksState {
  const factory UpdateFavoriteBooksState.initial() = _Initial;
  const factory UpdateFavoriteBooksState.loading() = _Loading;
  const factory UpdateFavoriteBooksState.success() = _Success;
  const factory UpdateFavoriteBooksState.error(String? message) = _Error;
}

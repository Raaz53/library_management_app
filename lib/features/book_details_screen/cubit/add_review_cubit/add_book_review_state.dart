part of 'add_book_review_cubit.dart';

@freezed
class AddBookReviewState with _$AddBookReviewState {
  const factory AddBookReviewState.initial() = _Initial;
  const factory AddBookReviewState.loading() = _Loading;
  const factory AddBookReviewState.success() = _Success;
  const factory AddBookReviewState.error(String message) = _Error;
}

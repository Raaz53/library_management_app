part of 'get_book_reviews_cubit.dart';

@freezed
class GetBookReviewsState with _$GetBookReviewsState {
  const factory GetBookReviewsState.initial() = _Initial;
  const factory GetBookReviewsState.loading() = _Loading;
  const factory GetBookReviewsState.success(List<ReviewModel>? bookReviews) =
      _Success;
  const factory GetBookReviewsState.error(String? message) = _Error;
}

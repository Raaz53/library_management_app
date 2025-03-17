part of 'edit_review_cubit.dart';

@freezed
class EditReviewState with _$EditReviewState {
  const factory EditReviewState.initial() = _Initial;
  const factory EditReviewState.loading() = _Loading;
  const factory EditReviewState.success() = _Success;
  const factory EditReviewState.error(String message) = _Error;
}

part of 'get_book_status_details_cubit.dart';

@freezed
class GetBookStatusDetailsState with _$GetBookStatusDetailsState {
  const factory GetBookStatusDetailsState.initial() = _Initial;
  const factory GetBookStatusDetailsState.loading() = _Loading;
  const factory GetBookStatusDetailsState.success(
      List<BookStatusDetail>? bookStatusDetails) = _Success;
  const factory GetBookStatusDetailsState.error(String? message) = _Error;
}

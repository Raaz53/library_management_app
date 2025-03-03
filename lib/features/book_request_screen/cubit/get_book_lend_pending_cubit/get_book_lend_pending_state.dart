part of 'get_book_lend_pending_cubit.dart';

@freezed
class GetBookLendPendingState with _$GetBookLendPendingState {
  const factory GetBookLendPendingState.initial() = _Initial;
  const factory GetBookLendPendingState.loading() = _Loading;
  const factory GetBookLendPendingState.success(
      List<BookLendedHistory>? bookLendHistory) = _Success;
  const factory GetBookLendPendingState.error(String? message) = _Error;
}

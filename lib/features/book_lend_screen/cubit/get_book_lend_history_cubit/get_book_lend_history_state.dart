part of 'get_book_lend_history_cubit.dart';

@freezed
class GetBookLendHistoryState with _$GetBookLendHistoryState {
  const factory GetBookLendHistoryState.initial() = _Initial;
  const factory GetBookLendHistoryState.loading() = _Loading;
  const factory GetBookLendHistoryState.success(
      List<BookLendedHistory>? bookLendedHistory) = _Success;
  const factory GetBookLendHistoryState.error(String? messages) = _Error;
}

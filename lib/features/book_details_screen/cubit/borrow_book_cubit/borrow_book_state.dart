part of 'borrow_book_cubit.dart';

@freezed
class BorrowBookState with _$BorrowBookState {
  const factory BorrowBookState.initial() = _Initial;
  const factory BorrowBookState.loading() = _Loading;
  const factory BorrowBookState.success() = _Success;
  const factory BorrowBookState.error(String? message) = _Error;
}

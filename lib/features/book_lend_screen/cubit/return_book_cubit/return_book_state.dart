part of 'return_book_cubit.dart';

@freezed
class ReturnBookState with _$ReturnBookState {
  const factory ReturnBookState.initial() = _Initial;
  const factory ReturnBookState.loading() = _Loading;
  const factory ReturnBookState.returned() = _Returned;
  const factory ReturnBookState.error() = _Error;
}

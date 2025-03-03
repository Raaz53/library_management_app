part of 'book_log_cubit.dart';

@freezed
class BookLogState with _$BookLogState {
  const factory BookLogState.initial() = _Initial;
  const factory BookLogState.loading() = _Loading;
  const factory BookLogState.success(String? studentBookStatus) = _Success;
  const factory BookLogState.error(String? message) = _Error;
}

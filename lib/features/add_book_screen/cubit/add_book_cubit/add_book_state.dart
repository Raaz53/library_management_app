part of 'add_book_cubit.dart';

@freezed
class AddBookState with _$AddBookState {
  const factory AddBookState.initial() = _Initial;
  const factory AddBookState.loading() = _Loading;
  const factory AddBookState.success({String? successMessage}) = _Success;
  const factory AddBookState.error({String? message}) = _Error;
}

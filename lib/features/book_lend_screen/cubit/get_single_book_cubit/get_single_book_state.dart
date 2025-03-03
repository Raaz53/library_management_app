part of 'get_single_book_cubit.dart';

@freezed
class GetSingleBookState with _$GetSingleBookState {
  const factory GetSingleBookState.initial() = _Initial;
  const factory GetSingleBookState.loading() = _Loading;
  const factory GetSingleBookState.success(FireBookModel? singleBook) =
      _Success;
  const factory GetSingleBookState.error(String? message) = _Error;
}

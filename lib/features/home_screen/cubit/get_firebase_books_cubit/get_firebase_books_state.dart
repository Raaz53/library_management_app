part of 'get_firebase_books_cubit.dart';

@freezed
class GetFirebaseBooksState with _$GetFirebaseBooksState {
  const factory GetFirebaseBooksState.initial() = _Initial;
  const factory GetFirebaseBooksState.loading() = _Loading;
  const factory GetFirebaseBooksState.success(List<FireBookModel>? books) =
      _Success;
  const factory GetFirebaseBooksState.error(String? error) = _Error;
}

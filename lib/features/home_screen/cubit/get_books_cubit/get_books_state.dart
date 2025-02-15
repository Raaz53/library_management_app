part of 'get_books_cubit.dart';

@freezed
class GetBooksState with _$GetBooksState {
  const factory GetBooksState.initial() = _Initial;
  const factory GetBooksState.loading() = _Loading;
  const factory GetBooksState.singleBook({BookItem? book}) = _Success;
  const factory GetBooksState.multipleBooks({required List<BookItem> books}) =
      _MultipleBooks;
  const factory GetBooksState.error({required String error}) = _Error;
}

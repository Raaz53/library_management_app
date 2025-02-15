import 'package:bloc/bloc.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:book_hive/core/models/google_book_model/google_book_model.dart';

part 'get_books_cubit.freezed.dart';
part 'get_books_state.dart';

class GetBooksCubit extends Cubit<GetBooksState> {
  GetBooksCubit() : super(GetBooksState.initial());

  Future<void> getBooks(String query) async {
    emit(GetBooksState.loading());
    try {
      final data = await BookService.fetchBooksWithQuery(query);
      if (data == null) {
        emit(GetBooksState.error(error: 'Error fetching books'));
      } else {
        emit(GetBooksState.multipleBooks(books: data));
      }
    } catch (e) {
      emit(GetBooksState.error(
        error: e.toString(),
      ));
    }
  }
}

import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_book_cubit.freezed.dart';
part 'add_book_state.dart';

class AddBookCubit extends Cubit<AddBookState> {
  AddBookCubit() : super(AddBookState.initial());

  Future<void> addBook(FireBookModel book) async {
    emit(AddBookState.loading());
    try {
      await BookService.addBookToFirebase(book);
      emit(AddBookState.success());
    } catch (e) {
      emit(AddBookState.error(message: e.toString()));
    }
  }
}

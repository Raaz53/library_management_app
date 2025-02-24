import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_firebase_books_cubit.freezed.dart';
part 'get_firebase_books_state.dart';

class GetFirebaseBooksCubit extends Cubit<GetFirebaseBooksState> {
  GetFirebaseBooksCubit() : super(GetFirebaseBooksState.initial());

  Future<void> getFirebaseBooks() async {
    try {
      final books = await BookService.getFirebaseBooks();
      emit(GetFirebaseBooksState.success(books));
    } catch (e) {
      emit(GetFirebaseBooksState.error(e.toString()));
    }
  }
}

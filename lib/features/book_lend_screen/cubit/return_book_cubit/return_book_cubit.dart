import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/book_return_model/book_return_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/book_services.dart';

part 'return_book_cubit.freezed.dart';
part 'return_book_state.dart';

class ReturnBookCubit extends Cubit<ReturnBookState> {
  ReturnBookCubit() : super(const ReturnBookState.initial());

  Future<void> returnBook(BookReturnModel? bookReturnModel) async {
    emit(const ReturnBookState.loading());
    try {
      // Simulate a network call
      final returned = await BookService.returnBook(bookReturnModel);
      if (returned == 'success') {
        emit(const ReturnBookState.returned());
      } else {
        emit(const ReturnBookState.error());
      }
    } catch (e) {
      emit(const ReturnBookState.error());
    }
  }
}

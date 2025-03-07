import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_single_book_cubit.freezed.dart';
part 'get_single_book_state.dart';

class GetSingleBookCubit extends Cubit<GetSingleBookState> {
  GetSingleBookCubit() : super(const GetSingleBookState.initial());

  Future<void> getSingleBook(String? bookId) async {
    final currentState = state;
    log('called again');
    if (currentState is _Success && currentState.singleBook?.bookId == bookId) {
      return;
    }
    emit(GetSingleBookState.loading());
    try {
      final book = await BookService.getSingleFireBook(bookId);
      if (book != null) {
        emit(GetSingleBookState.success(book));
      }
    } catch (e) {
      emit(GetSingleBookState.error(e.toString()));
    }
  }
}

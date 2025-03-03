import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_book_status_details_cubit.freezed.dart';
part 'get_book_status_details_state.dart';

class GetBookStatusDetailsCubit extends Cubit<GetBookStatusDetailsState> {
  GetBookStatusDetailsCubit()
      : super(const GetBookStatusDetailsState.initial());

  Future<void> getBookStatusDetails(String? bookId) async {
    emit(GetBookStatusDetailsState.loading());
    try {
      final data = await BookService.getBookStatusDetails(bookId);
      if (data != null) {
        emit(GetBookStatusDetailsState.success(data));
      }
    } catch (e) {
      log('Error fetching book status cubit');
      emit(GetBookStatusDetailsState.error(e.toString()));
    }
  }
}

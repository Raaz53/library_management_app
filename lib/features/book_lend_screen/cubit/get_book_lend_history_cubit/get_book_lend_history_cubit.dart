import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_book_lend_history_cubit.freezed.dart';
part 'get_book_lend_history_state.dart';

class GetBookLendHistoryCubit extends Cubit<GetBookLendHistoryState> {
  GetBookLendHistoryCubit() : super(const GetBookLendHistoryState.initial());

  Future<void> getBookLendHistory(List<String>? bookLendIds) async {
    emit(GetBookLendHistoryState.loading());
    try {
      final data = await BookService.getLendBookHistory(bookLendIds);
      if (data != null && data != []) {
        emit(GetBookLendHistoryState.success(data));
      }
    } catch (e) {
      log('Error fetching user book history cubit');
      emit(GetBookLendHistoryState.error(e.toString()));
    }
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_book_lend_pending_cubit.freezed.dart';
part 'get_book_lend_pending_state.dart';

class GetBookLendPendingCubit extends Cubit<GetBookLendPendingState> {
  GetBookLendPendingCubit() : super(const GetBookLendPendingState.initial());

  Future<void> getPendingBookLogs() async {
    emit(GetBookLendPendingState.loading());
    try {
      final data = await BookService.getBookLog();
      log('data here is ${data.toString()}');
      emit(GetBookLendPendingState.success(data));
    } catch (e) {
      emit(GetBookLendPendingState.error(e.toString()));
    }
  }
}

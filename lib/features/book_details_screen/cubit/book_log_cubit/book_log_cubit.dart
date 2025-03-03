import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_log_cubit.freezed.dart';
part 'book_log_state.dart';

class BookLogCubit extends Cubit<BookLogState> {
  BookLogCubit() : super(const BookLogState.initial());

  Future<void> getBookLog(String? bendLendId) async {
    emit(BookLogState.loading());
    try {
      final BookLendedHistory? data =
          await BookService.getBookLendLog(bendLendId);
      if (data != null) {
        emit(BookLogState.success(data.bookIssueStatus));
      } else {
        emit(BookLogState.error('error'));
      }
    } catch (e) {
      log('here the error is thrown in book log cubit');
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/services/auth_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'borrow_book_cubit.freezed.dart';
part 'borrow_book_state.dart';

class BorrowBookCubit extends Cubit<BorrowBookState> {
  BorrowBookCubit() : super(const BorrowBookState.initial());

  Future<void> requestBookBorrow(BookLendedHistory? bookLendedHistory) async {
    emit(BorrowBookState.loading());
    try {
      final data = await AuthService.requestBookLend(bookLendedHistory);
      if (data == 'success') {
        emit(BorrowBookState.success());
      } else {
        emit(BorrowBookState.error('failure'));
      }
    } catch (e) {
      emit(BorrowBookState.error(e.toString()));
    }
  }
}

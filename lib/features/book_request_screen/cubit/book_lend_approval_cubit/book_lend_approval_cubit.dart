import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/book_lend_approval_model/book_lend_approval_model.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_lend_approval_cubit.freezed.dart';
part 'book_lend_approval_state.dart';

class BookLendApprovalCubit extends Cubit<BookLendApprovalState> {
  BookLendApprovalCubit() : super(const BookLendApprovalState.initial());

  Future<void> acceptBookLend(
      BookLendApprovalModel? bookLendApprovalModel) async {
    emit(BookLendApprovalState.loading());
    try {
      await BookService.acceptBookLend(bookLendApprovalModel);
      emit(BookLendApprovalState.accept());
    } catch (e) {
      emit(BookLendApprovalState.error(
          'Error thrown in accept book lend cubit'));
    }
  }

  Future<void> declineBookLend(
      BookLendApprovalModel? bookLendApprovalModel) async {
    emit(BookLendApprovalState.loading());
    try {
      await BookService.declineBookLend(bookLendApprovalModel);
      emit(BookLendApprovalState.decline());
    } catch (e) {
      emit(BookLendApprovalState.error(
          'Error thrown in accept book lend cubit'));
    }
  }
}

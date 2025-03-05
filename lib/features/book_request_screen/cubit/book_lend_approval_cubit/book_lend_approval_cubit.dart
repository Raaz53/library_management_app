import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_lend_approval_state.dart';
part 'book_lend_approval_cubit.freezed.dart';

class BookLendApprovalCubit extends Cubit<BookLendApprovalState> {
  BookLendApprovalCubit() : super(const BookLendApprovalState.initial());
}

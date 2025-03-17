import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_book_review_cubit.freezed.dart';
part 'add_book_review_state.dart';

class AddBookReviewCubit extends Cubit<AddBookReviewState> {
  AddBookReviewCubit() : super(const AddBookReviewState.initial());

  Future<void> addBookReview(ReviewModel? reviewModel, String? bookId) async {
    emit(const AddBookReviewState.loading());
    try {
      await BookService.addReview(reviewModel, bookId);
    } catch (e) {
      emit(AddBookReviewState.error(e.toString()));
      return;
    }

    emit(const AddBookReviewState.success());
  }
}

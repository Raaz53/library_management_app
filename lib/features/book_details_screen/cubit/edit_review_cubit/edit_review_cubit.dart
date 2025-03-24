import 'package:bloc/bloc.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_review_cubit.freezed.dart';
part 'edit_review_state.dart';

class EditReviewCubit extends Cubit<EditReviewState> {
  EditReviewCubit() : super(const EditReviewState.initial());

  Future<void> editUserReview(String? bookId, String? reviewId,
      String? updatedReview, double? updatedRating) async {
    emit(const EditReviewState.loading());
    try {
      await BookService.editReview(
          updatedReview, bookId, reviewId, updatedRating);
      emit(const EditReviewState.success());
    } catch (e) {
      emit(EditReviewState.error(e.toString()));
    }
  }
}

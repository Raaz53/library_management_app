import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/book_services.dart';

part 'get_book_reviews_cubit.freezed.dart';
part 'get_book_reviews_state.dart';

class GetBookReviewsCubit extends Cubit<GetBookReviewsState> {
  GetBookReviewsCubit() : super(const GetBookReviewsState.initial());

  Future<void> getBookReviews(String? bookId) async {
    emit(const GetBookReviewsState.loading());
    try {
      final List<ReviewModel>? bookReviews =
          await BookService.getReviews(bookId);
      log('length: ${bookReviews?.length}');
      emit(GetBookReviewsState.success(bookReviews));
    } catch (e) {
      emit(GetBookReviewsState.error(e.toString()));
    }
  }
}

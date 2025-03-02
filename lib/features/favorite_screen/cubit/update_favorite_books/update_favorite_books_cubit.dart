import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_hive/core/services/auth_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_favorite_books_cubit.freezed.dart';
part 'update_favorite_books_state.dart';

class UpdateFavoriteBooksCubit extends Cubit<UpdateFavoriteBooksState> {
  UpdateFavoriteBooksCubit() : super(const UpdateFavoriteBooksState.initial());

  Future<void> updateFavoriteBooks(String bookId, bool isFavorite) async {
    emit(const UpdateFavoriteBooksState.loading());
    try {
      final result = await AuthService.updateFavoriteList(bookId, isFavorite);
      if (result == 'success') {
        emit(const UpdateFavoriteBooksState.success());
      } else {
        emit(const UpdateFavoriteBooksState.error(
            'Failed to update favorite books.'));
      }
    } catch (err) {
      log('Error updating favorite book: $err');
      emit(UpdateFavoriteBooksState.error(err.toString()));
    }
  }
}

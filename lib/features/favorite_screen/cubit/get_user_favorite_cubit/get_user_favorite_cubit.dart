import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/services/book_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_favorite_cubit.freezed.dart';
part 'get_user_favorite_state.dart';

class GetUserFavoriteCubit extends Cubit<GetUserFavoriteState> {
  GetUserFavoriteCubit() : super(const GetUserFavoriteState.initial());

  Future<void> getUserFavoriteBooks(List<String>? favoriteBooksId) async {
    emit(GetUserFavoriteState.loading());
    try {
      final data = await BookService.getFavoriteBooks(favoriteBooksId);
      emit(GetUserFavoriteState.success(data));
    } catch (e) {
      log('Here the error is thrown in get user cubit $e');
      emit(GetUserFavoriteState.error(e.toString()));
    }
  }
}

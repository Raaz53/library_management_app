import 'package:book_hive/features/add_book_screen/cubit/add_book_cubit/add_book_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/add_review_cubit/add_book_review_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/book_log_cubit/book_log_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/borrow_book_cubit/borrow_book_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/edit_review_cubit/edit_review_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/get_book_reviews_cubit/get_book_reviews_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/get_book_status_details_cubit/get_book_status_details_cubit.dart';
import 'package:book_hive/features/book_lend_screen/cubit/get_book_lend_history_cubit/get_book_lend_history_cubit.dart';
import 'package:book_hive/features/book_lend_screen/cubit/get_single_book_cubit/get_single_book_cubit.dart';
import 'package:book_hive/features/book_request_screen/cubit/book_lend_approval_cubit/book_lend_approval_cubit.dart';
import 'package:book_hive/features/book_request_screen/cubit/get_book_lend_pending_cubit/get_book_lend_pending_cubit.dart';
import 'package:book_hive/features/book_request_screen/cubit/get_user_by_id_cubit/get_user_by_id_cubit.dart';
import 'package:book_hive/features/favorite_screen/cubit/get_user_favorite_cubit/get_user_favorite_cubit.dart';
import 'package:book_hive/features/favorite_screen/cubit/update_favorite_books/update_favorite_books_cubit.dart';
import 'package:book_hive/features/home_screen/cubit/get_books_cubit/get_books_cubit.dart';
import 'package:book_hive/features/home_screen/cubit/get_firebase_books_cubit/get_firebase_books_cubit.dart';
import 'package:book_hive/features/login_screen/cubit/user_signin_cubit/user_signin_cubit.dart';
import 'package:book_hive/features/setting_screen/cubit/get_user_profile_cubit.dart';

import 'injection.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    _initializeAuthBloc();
    _initializeServiceBloc();
  }

  static void _initializeAuthBloc() {
    final injector = Injector.instance;
    injector
      ..registerLazySingleton<UserSignInCubit>(() => UserSignInCubit())
      ..registerLazySingleton<GetBooksCubit>(() => GetBooksCubit())
      ..registerLazySingleton<AddBookCubit>(() => AddBookCubit())
      ..registerLazySingleton<BorrowBookCubit>(() => BorrowBookCubit())
      ..registerLazySingleton<BookLogCubit>(() => BookLogCubit())
      ..registerLazySingleton<GetSingleBookCubit>(() => GetSingleBookCubit())
      ..registerLazySingleton<GetUserByIdCubit>(() => GetUserByIdCubit())
      ..registerLazySingleton<AddBookReviewCubit>(() => AddBookReviewCubit())
      ..registerLazySingleton<GetBookReviewsCubit>(() => GetBookReviewsCubit())
      ..registerLazySingleton<EditReviewCubit>(() => EditReviewCubit())
      ..registerLazySingleton<BookLendApprovalCubit>(
          () => BookLendApprovalCubit())
      ..registerLazySingleton<GetBookLendPendingCubit>(
          () => GetBookLendPendingCubit())
      ..registerLazySingleton<GetBookLendHistoryCubit>(
          () => GetBookLendHistoryCubit())
      ..registerLazySingleton<GetBookStatusDetailsCubit>(
          () => GetBookStatusDetailsCubit())
      ..registerLazySingleton<GetUserFavoriteCubit>(
          () => GetUserFavoriteCubit())
      ..registerLazySingleton<UpdateFavoriteBooksCubit>(
          () => UpdateFavoriteBooksCubit())
      ..registerLazySingleton<GetFirebaseBooksCubit>(
          () => GetFirebaseBooksCubit())
      ..registerLazySingleton<GetUserProfileCubit>(() => GetUserProfileCubit());
  }

  static void _initializeServiceBloc() {}
}

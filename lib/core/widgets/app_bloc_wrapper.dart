import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/features/add_book_screen/cubit/add_book_cubit/add_book_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/book_log_cubit/book_log_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/borrow_book_cubit/borrow_book_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/get_book_status_details_cubit/get_book_status_details_cubit.dart';
import 'package:book_hive/features/book_lend_screen/cubit/get_book_lend_history_cubit/get_book_lend_history_cubit.dart';
import 'package:book_hive/features/book_lend_screen/cubit/get_single_book_cubit/get_single_book_cubit.dart';
import 'package:book_hive/features/book_request_screen/cubit/get_book_lend_pending_cubit/get_book_lend_pending_cubit.dart';
import 'package:book_hive/features/favorite_screen/cubit/get_user_favorite_cubit/get_user_favorite_cubit.dart';
import 'package:book_hive/features/favorite_screen/cubit/update_favorite_books/update_favorite_books_cubit.dart';
import 'package:book_hive/features/home_screen/cubit/get_books_cubit/get_books_cubit.dart';
import 'package:book_hive/features/home_screen/cubit/get_firebase_books_cubit/get_firebase_books_cubit.dart';
import 'package:book_hive/features/login_screen/cubit/user_signin_cubit/user_signin_cubit.dart';
import 'package:book_hive/features/setting_screen/cubit/get_user_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocWrapper extends StatelessWidget {
  const AppBlocWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserSignInCubit>.value(
          value: Injector.instance<UserSignInCubit>(),
        ),
        BlocProvider<GetUserProfileCubit>.value(
          value: Injector.instance<GetUserProfileCubit>(),
        ),
        BlocProvider<GetBooksCubit>.value(
          value: Injector.instance<GetBooksCubit>(),
        ),
        BlocProvider<GetFirebaseBooksCubit>.value(
          value: Injector.instance<GetFirebaseBooksCubit>(),
        ),
        BlocProvider<UpdateFavoriteBooksCubit>.value(
          value: Injector.instance<UpdateFavoriteBooksCubit>(),
        ),
        BlocProvider<GetUserFavoriteCubit>.value(
          value: Injector.instance<GetUserFavoriteCubit>(),
        ),
        BlocProvider<GetBookStatusDetailsCubit>.value(
          value: Injector.instance<GetBookStatusDetailsCubit>(),
        ),
        BlocProvider<AddBookCubit>.value(
          value: Injector.instance<AddBookCubit>(),
        ),
        BlocProvider<BorrowBookCubit>.value(
          value: Injector.instance<BorrowBookCubit>(),
        ),
        BlocProvider<BookLogCubit>.value(
          value: Injector.instance<BookLogCubit>(),
        ),
        BlocProvider<GetBookLendHistoryCubit>.value(
          value: Injector.instance<GetBookLendHistoryCubit>(),
        ),
        BlocProvider<GetSingleBookCubit>.value(
          value: Injector.instance<GetSingleBookCubit>(),
        ),
        BlocProvider<GetBookLendPendingCubit>.value(
          value: Injector.instance<GetBookLendPendingCubit>(),
        ),
      ],
      child: child,
    );
  }
}

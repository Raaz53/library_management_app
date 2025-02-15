import 'package:book_hive/features/home_screen/cubit/get_books_cubit/get_books_cubit.dart';
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
      ..registerLazySingleton<GetUserProfileCubit>(() => GetUserProfileCubit());
  }

  static void _initializeServiceBloc() {}
}

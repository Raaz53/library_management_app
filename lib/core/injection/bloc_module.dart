import 'package:book_hive/features/login_screen/cubit/user_signin_cubit/user_signin_cubit.dart';

import 'injection.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    _initializeAuthBloc();
    _initializeServiceBloc();
  }

  static void _initializeAuthBloc() {
    final injector = Injector.instance;
    injector..registerLazySingleton<UserSignInCubit>(() => UserSignInCubit());
  }

  static void _initializeServiceBloc() {}
}

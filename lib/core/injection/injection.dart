import 'package:book_hive/core/routes/routes.dart';
import 'package:book_hive/core/services/google_book_api_handler.dart';
import 'package:get_it/get_it.dart';

import 'bloc_module.dart';

class Injector {
  Injector._();
  static final GetIt instance = GetIt.instance;
  static Future<void> init() async {
    instance.registerLazySingleton<AppRoute>(() => AppRoute());
    instance.registerLazySingleton<GoogleBookApiHandler>(
        () => GoogleBookApiHandler());
    BlocModule.init();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}

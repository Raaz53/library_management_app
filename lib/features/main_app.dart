import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/widgets/app_bloc_wrapper.dart';
import 'package:flutter/material.dart';

import '../core/injection/injection.dart';
import '../core/routes/routes.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AppRoute _router;

  @override
  void initState() {
    super.initState();
    _router = Injector.instance<AppRoute>();
  }

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapper(
      child: MaterialApp.router(
        routerConfig:
            _router.config(navigatorObservers: () => [AutoRouteObserver()]),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

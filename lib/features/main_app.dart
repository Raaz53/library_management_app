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
    _router = getIt<AppRoute>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}

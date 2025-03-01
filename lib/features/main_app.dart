import 'package:book_hive/core/widgets/app_bloc_wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final User? user = snapshot.data;

          return MaterialApp.router(
            routerConfig: _router.config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

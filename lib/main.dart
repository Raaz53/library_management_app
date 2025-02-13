import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'core/injection/injection.dart';
import 'features/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize dependency injection
  runApp(const MainApp());
}

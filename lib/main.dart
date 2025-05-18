import 'package:book_hive/core/utilities/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'core/injection/injection.dart';
import 'features/main_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: GoogleCredentials.apiKey, enableDebugging: true);

  await Injector.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize dependency injection
  runApp(const MainApp());
}

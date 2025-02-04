import 'package:flutter/material.dart';

import 'core/injection/injection.dart';
import 'features/main_app.dart';

void main() async {
  configureInjection(); // Initialize dependency injection
  runApp(const MainApp());
}

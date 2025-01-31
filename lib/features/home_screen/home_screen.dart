import 'package:auto_route/annotations.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'Home')
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
    );
  }
}

import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'here the favorite screen',
        style: AppTextStyles.bodyLargePoppins,
      ),
    );
  }
}

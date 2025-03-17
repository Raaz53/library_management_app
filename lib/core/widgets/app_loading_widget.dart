import 'package:book_hive/core/resources/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Lottie.asset(LottieAssets.loading),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/routes/routes.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(name: 'Onboarding')
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgAssets.onBoarding),
                    10.verticalBox,
                    Text(
                      'Explore',
                      style: AppTextStyles.headlineLargeMonserat.copyWith(
                          fontSize: 50,
                          color: AppColors.black,
                          fontWeight: FontWeight.w900),
                    ),
                    10.verticalBox,
                    Text(
                      'Discover new reads',
                      style: AppTextStyles.headlineSmallPoppins
                          .copyWith(color: AppColors.black, letterSpacing: 5),
                    ),
                  ],
                ),
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: AppColors.buttonSecondary,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(0),
              //     ),
              //   ),
              //   onPressed: () {},
              //   child: SizedBox(
              //     height: 50,
              //     width: double.infinity,
              //     child: Center(
              //       child: Text(
              //         'Get Started',
              //       ),
              //     ),
              //   ),
              // ),
              AppButton(
                title: 'Get Started',
                onClick: () => context.router.push(LogIn()),
                backgroundColor: AppColors.buttonSecondary,
                textColor: AppColors.black,
                elevation: 2,
                width: double.infinity,
                height: 50,
                radius: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../features/book_details_screen/book_details_screen.dart';
import '../../features/dashboard_page/dashboard_page.dart';
import '../../features/home_screen/home_screen.dart';
import '../../features/login_screen/log_in_screen.dart';
import '../../features/login_screen/sign_in_screen.dart';
import '../../features/onboarding_screen/onboarding_screen.dart';
import '../../features/reward/reward_screen.dart';
import '../../features/reward_add_on_screen/reward_add_on_screen.dart';

part 'routes.gr.dart';

@injectable
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRoute extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: Onboarding.page, initial: true, path: '/'),
        AutoRoute(page: LogIn.page),
        AutoRoute(page: SignIn.page),
        AutoRoute(page: Home.page),
        AutoRoute(page: Dashboard.page),
        AutoRoute(
          page: BookDetails.page,
        ),
        AutoRoute(page: RewardAddOn.page),
        AutoRoute(page: Reward.page)
      ];
}

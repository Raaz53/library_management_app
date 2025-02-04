import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../features/dashboard_page/dashboard_page.dart';
import '../../features/home_screen/home_screen.dart';
import '../../features/login_screen/log_in_screen.dart';
import '../../features/login_screen/sign_in_screen.dart';
import '../../features/onboarding_screen/onboarding_screen.dart';

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
      ];
}

import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../features/onboarding_screen/onboarding_screen.dart';

part 'routes.gr.dart';

@injectable
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRoute extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: Onboarding.page, initial: true, path: '/'),
      ];
}

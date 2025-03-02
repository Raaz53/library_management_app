// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

/// generated route for
/// [BookDetailsScreen]
class BookDetails extends PageRouteInfo<BookDetailsArgs> {
  BookDetails({
    Key? key,
    FireBookModel? fireBookModel,
    List<PageRouteInfo>? children,
  }) : super(
         BookDetails.name,
         args: BookDetailsArgs(key: key, fireBookModel: fireBookModel),
         initialChildren: children,
       );

  static const String name = 'BookDetails';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookDetailsArgs>(
        orElse: () => const BookDetailsArgs(),
      );
      return BookDetailsScreen(
        key: args.key,
        fireBookModel: args.fireBookModel,
      );
    },
  );
}

class BookDetailsArgs {
  const BookDetailsArgs({this.key, this.fireBookModel});

  final Key? key;

  final FireBookModel? fireBookModel;

  @override
  String toString() {
    return 'BookDetailsArgs{key: $key, fireBookModel: $fireBookModel}';
  }
}

/// generated route for
/// [DashboardScreen]
class Dashboard extends PageRouteInfo<void> {
  const Dashboard({List<PageRouteInfo>? children})
    : super(Dashboard.name, initialChildren: children);

  static const String name = 'Dashboard';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class Home extends PageRouteInfo<void> {
  const Home({List<PageRouteInfo>? children})
    : super(Home.name, initialChildren: children);

  static const String name = 'Home';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LogInScreen]
class LogIn extends PageRouteInfo<void> {
  const LogIn({List<PageRouteInfo>? children})
    : super(LogIn.name, initialChildren: children);

  static const String name = 'LogIn';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LogInScreen();
    },
  );
}

/// generated route for
/// [OnboardingScreen]
class Onboarding extends PageRouteInfo<void> {
  const Onboarding({List<PageRouteInfo>? children})
    : super(Onboarding.name, initialChildren: children);

  static const String name = 'Onboarding';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
    },
  );
}

/// generated route for
/// [SignInScreen]
class SignIn extends PageRouteInfo<void> {
  const SignIn({List<PageRouteInfo>? children})
    : super(SignIn.name, initialChildren: children);

  static const String name = 'SignIn';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignInScreen();
    },
  );
}

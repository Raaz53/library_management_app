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
    List<String>? lendedBooksLog,
    List<PageRouteInfo>? children,
  }) : super(
         BookDetails.name,
         args: BookDetailsArgs(
           key: key,
           fireBookModel: fireBookModel,
           lendedBooksLog: lendedBooksLog,
         ),
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
        lendedBooksLog: args.lendedBooksLog,
      );
    },
  );
}

class BookDetailsArgs {
  const BookDetailsArgs({this.key, this.fireBookModel, this.lendedBooksLog});

  final Key? key;

  final FireBookModel? fireBookModel;

  final List<String>? lendedBooksLog;

  @override
  String toString() {
    return 'BookDetailsArgs{key: $key, fireBookModel: $fireBookModel, lendedBooksLog: $lendedBooksLog}';
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
/// [RewardAddOnScreen]
class RewardAddOn extends PageRouteInfo<RewardAddOnArgs> {
  RewardAddOn({
    Key? key,
    double? currentPoints,
    String? userName,
    List<PageRouteInfo>? children,
  }) : super(
         RewardAddOn.name,
         args: RewardAddOnArgs(
           key: key,
           currentPoints: currentPoints,
           userName: userName,
         ),
         initialChildren: children,
       );

  static const String name = 'RewardAddOn';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RewardAddOnArgs>(
        orElse: () => const RewardAddOnArgs(),
      );
      return RewardAddOnScreen(
        key: args.key,
        currentPoints: args.currentPoints,
        userName: args.userName,
      );
    },
  );
}

class RewardAddOnArgs {
  const RewardAddOnArgs({this.key, this.currentPoints, this.userName});

  final Key? key;

  final double? currentPoints;

  final String? userName;

  @override
  String toString() {
    return 'RewardAddOnArgs{key: $key, currentPoints: $currentPoints, userName: $userName}';
  }
}

/// generated route for
/// [RewardScreen]
class Reward extends PageRouteInfo<void> {
  const Reward({List<PageRouteInfo>? children})
    : super(Reward.name, initialChildren: children);

  static const String name = 'Reward';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RewardScreen();
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

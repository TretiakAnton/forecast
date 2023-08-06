import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forecast/core/routing/routes.dart';
import 'package:forecast/presentation/view/screens/home_screen.dart';
import 'package:forecast/presentation/view/screens/login_screen.dart';
import 'package:forecast/presentation/view/screens/splash_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      path: Routes.splashScreen,
      initial: true,
    ),
    AutoRoute(
      page: HomeScreen,
      path: Routes.homeScreen,
    ),
    AutoRoute(
      page: LoginScreen,
      path: Routes.loginScreen,
    ),
  ],
)
class AppRouter extends _$AppRouter {}

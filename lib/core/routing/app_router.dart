import 'package:flutter/material.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/features/choose_mode/presentation/pages/choose_mode.dart';
import 'package:spotify_app/features/get_started/presentation/pages/get_started_page.dart';
import 'package:spotify_app/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case Routes.getStartedPage:
        return MaterialPageRoute(
          builder: (context) => const GetStartedPage(),
        );
      case Routes.chooseModePage:
        return MaterialPageRoute(
          builder: (context) => const ChooseModePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Page not found"),
            ),
          ),
        );
    }
  }
}

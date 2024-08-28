import 'package:flutter/material.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(builder: (context) => const SplashPage());
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

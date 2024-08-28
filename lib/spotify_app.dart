import 'package:flutter/material.dart';
import 'package:spotify_app/core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_theme.dart';

class SpotifyApp extends StatelessWidget {
  final AppRouter appRouter;

  const SpotifyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashPage,
      onGenerateRoute: appRouter.onGenerateRoute,
    );

  }
}

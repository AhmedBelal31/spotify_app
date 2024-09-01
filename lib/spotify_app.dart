import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_theme.dart';
import 'features/choose_mode/presentation/cubit/choose_mode_cubit.dart';

class SpotifyApp extends StatelessWidget {
  final AppRouter appRouter;

  const SpotifyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChooseModeCubit(),
      child: BlocBuilder<ChooseModeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            title: 'Spotify App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode:mode,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splashPage,
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}

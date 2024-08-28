import 'package:flutter/material.dart';
import 'package:spotify_app/core/routing/app_router.dart';
import 'package:spotify_app/spotify_app.dart';

void main() {
  runApp(
    SpotifyApp(appRouter: AppRouter()),
  );
}

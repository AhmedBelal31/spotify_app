import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/theme/app_vectors.dart';
import '../../../../core/routing/routes.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    navigateToGetStartedPage();
  }
  Future<void> navigateToGetStartedPage() async {
    await Future.delayed(const Duration(seconds:2));
    Navigator.pushReplacementNamed(context, Routes.getStartedPage);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SvgPicture.asset(AppVectors.appLogo),
        )
    );
  }
}

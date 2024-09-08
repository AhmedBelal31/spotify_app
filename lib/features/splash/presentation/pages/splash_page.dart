import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/helpers/shared_pref.dart';
import 'package:spotify_app/core/theme/app_vectors.dart';
import '../../../../core/routing/routes.dart';
import 'package:spotify_app/const.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigateToGetStartedPage(context);
  }

  Future<void> navigateToGetStartedPage(context) async {
    var isFirstTime = await Prefs.getData(firstTime);
    var isSignIn = await Prefs.getData(alreadySignIn);
    await Future.delayed(const Duration(seconds: 2));
    if (isFirstTime == true || isFirstTime == null) {
      Navigator.pushReplacementNamed(context, Routes.getStartedPage);
    } else {
      if (isSignIn == true) {
        Navigator.pushReplacementNamed(context, Routes.homePage);
      } else {
        Navigator.pushReplacementNamed(context, Routes.signInAndSignUpPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SvgPicture.asset(AppVectors.appLogo),
    ));
  }
}

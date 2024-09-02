import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/extensions/is_dark_mode.dart';

import '../../../../core/theme/app_vectors.dart';

class SignInWithSocialMedia extends StatelessWidget {
  const SignInWithSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              ///Create Logic Here
            },
            child: SvgPicture.asset(AppVectors.googleIcon)),
        const SizedBox(width: 60),
        GestureDetector(
          onTap: () {
            ///Create Logic Here
          },
          child: SvgPicture.asset(
            AppVectors.appleIcon,
            colorFilter: ColorFilter.mode(
              context.isDarkMode ? Colors.white : Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
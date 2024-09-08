import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/extensions/is_dark_mode.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/theme/app_images.dart';
import 'package:spotify_app/core/widgets/app_button.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_vectors.dart';
import '../../../../core/widgets/app_bar.dart';

class SignInAndSignUpPage extends StatelessWidget {
  const SignInAndSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.signInAndSignUpTopPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.signInAndSignUpBottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.singInAndSignUpCharacter),
          ),
          Positioned(
            top: 175,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVectors.appLogo),
                  ],
                ),
                const SizedBox(height: 55),
                Padding(
                  padding: const EdgeInsets.only(left: 34),
                  child: Text(
                    'Enjoy Listening To Music',
                    style: TextStyles.font26Bold,
                  ),
                ),
                const SizedBox(height: 21),
                Padding(
                  padding: const EdgeInsets.only(left: 34),
                  child: Text(
                    'Spotify is a proprietary Swedish audio \n streaming and media services provider ',
                    style: TextStyles.font17Regular.copyWith(
                      color: AppColors.greyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 34),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes.signUpPage);
                          },
                          text: 'Register',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes.signInPage);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Sign in',
                              style: TextStyles.font19Medium.copyWith(
                                color: context.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 34),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

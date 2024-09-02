import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/extensions/is_dark_mode.dart';
import 'package:spotify_app/core/widgets/app_bar.dart';
import 'package:spotify_app/core/widgets/app_button.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_vectors.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../widgets/sign_up_widgets/need_support.dart';
import '../widgets/sign_up_widgets/or_divider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(withLogo: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 47),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Register',
                  style: TextStyles.font30Bold,
                ),
              ),
              const SizedBox(height: 15),
              const NeedSupport(),
              const SizedBox(height: 26),
              AppTextFormField(
                hintText: 'Full Name ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const AppTextFormField(
                hintText: 'Enter Email',
              ),
              const SizedBox(height: 16),
              const AppTextFormField(
                hintText: 'Password ',
                isThereASuffix: true,
              ),
              const SizedBox(height: 33),
              AppButton(
                onPressed: () {},
                text: 'Create Account',
              ),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 44),
              Row(
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
              ),
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  text: 'Already Have An Account? ',
                  style: TextStyles.font15Regular.copyWith(
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: 'Sign In',
                        style: TextStyles.font16Medium.copyWith(
                          color: AppColors.primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed(Routes.signInPage);
                          })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

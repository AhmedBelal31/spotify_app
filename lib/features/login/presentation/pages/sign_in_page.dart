import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/extensions/is_dark_mode.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_vectors.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../widgets/sign_up_widgets/need_support.dart';
import '../widgets/sign_up_widgets/or_divider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
                  'Sign In',
                  style: TextStyles.font30Bold,
                ),
              ),
              const SizedBox(height: 15),
              const NeedSupport(),
              const SizedBox(height: 26),
              AppTextFormField(
                hintText: 'Enter UserName Or Email ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const AppTextFormField(
                hintText: 'Password ',
                isThereASuffix: true,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Recovery Password',
                    style: TextStyles.font13Bold.copyWith(
                      color: context.isDarkMode ? const Color(0xffAEAEAE): const Color(0xff383838),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AppButton(
                onPressed: () {},
                text: 'Sign In',
              ),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 44),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.googleIcon),
                  const SizedBox(width: 60),
                  SvgPicture.asset(
                    AppVectors.appleIcon,
                    colorFilter: ColorFilter.mode(
                      context.isDarkMode ? Colors.white : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  text: 'Not A Member? ',
                  style: TextStyles.font15Regular.copyWith(
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: 'Register Now',
                        style: TextStyles.font16Medium.copyWith(
                          color: AppColors.primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed(Routes.signUpPage);
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

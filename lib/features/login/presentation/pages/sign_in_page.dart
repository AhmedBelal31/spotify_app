import 'package:flutter/material.dart';
import 'package:spotify_app/core/extensions/is_dark_mode.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../widgets/sign_in_with_social_media.dart';
import '../widgets/sign_in_widgets/not_a_member_register.dart';
import '../widgets/sign_up_widgets/need_support.dart';
import '../widgets/or_divider.dart';

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
                child: buildRecoveryButton(context),
              ),
              const SizedBox(height: 20),
              AppButton(
                onPressed: () {},
                text: 'Sign In',
              ),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 44),
              const SignInWithSocialMedia(),
              const SizedBox(height: 30),
              const NotAMemberRegister(),
            ],
          ),
        ),
      ),
    );
  }

  TextButton buildRecoveryButton(BuildContext context) {
    return TextButton(
                onPressed: () {},
                child: Text(
                  'Recovery Password',
                  style: TextStyles.font13Bold.copyWith(
                    color: context.isDarkMode
                        ? const Color(0xffAEAEAE)
                        : const Color(0xff383838),
                  ),
                ),
              );
  }
}




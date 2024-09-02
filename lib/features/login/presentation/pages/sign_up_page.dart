import 'package:flutter/material.dart';
import 'package:spotify_app/core/widgets/app_bar.dart';
import 'package:spotify_app/core/widgets/app_button.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../widgets/sign_in_with_social_media.dart';
import '../widgets/sign_up_widgets/already_have_account.dart';
import '../widgets/sign_up_widgets/need_support.dart';
import '../widgets/or_divider.dart';

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
              const SignInWithSocialMedia(),
              const SizedBox(height: 30),
              const AlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

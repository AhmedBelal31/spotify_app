import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/extensions/is_dark_mode.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../cubit/sign_in_cubit/sign_in_cubit.dart';
import '../or_divider.dart';
import '../sign_in_with_social_media.dart';
import '../sign_up_widgets/need_support.dart';
import 'not_a_member_register.dart';

class SignInPageBody extends StatefulWidget {
  const SignInPageBody({super.key});

  @override
  State<SignInPageBody> createState() => _SignInPageBodyState();
}

class _SignInPageBodyState extends State<SignInPageBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 47),
               Align(
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
                hintText: 'Enter Email ',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppTextFormField(
                hintText: 'Password ',
                controller: _passwordController,
                isThereASuffix: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter our password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: buildRecoveryButton(context),
              ),
              const SizedBox(height: 20),
              AppButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    context.read<SignInCubit>().signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
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

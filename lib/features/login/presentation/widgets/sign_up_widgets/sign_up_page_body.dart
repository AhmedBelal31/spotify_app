import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../domain/entities/user_entity.dart';
import '../../cubit/sign_up_cubit/sign_up_cubit.dart';
import '../or_divider.dart';
import '../sign_in_with_social_media.dart';
import 'already_have_account.dart';
import 'need_support.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({super.key});

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppTextFormField(
                hintText: 'Enter Email',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
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
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 33),
              AppButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    UserEntity user = UserEntity(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    context
                        .read<SignUpCubit>()
                        .signUpWithEmailAndPassword(user: user);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
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

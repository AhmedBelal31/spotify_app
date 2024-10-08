import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/const.dart';
import 'package:spotify_app/core/widgets/custom_progress_hud.dart';
import 'package:spotify_app/core/widgets/custom_snack_bar.dart';
import 'package:spotify_app/features/login/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:spotify_app/features/login/presentation/cubit/sign_in_cubit/sign_in_state.dart';
import '../../../../core/di/get_it.dart';
import '../../../../core/helpers/shared_pref.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_bar.dart';
import '../widgets/sign_in_widgets/sign_in_page_body.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(withLogo: true),
      body: BlocProvider(
        create: (context) => ServiceLocator.di.get<SignInCubit>(),
        child: BlocConsumer<SignInCubit, SignInStates>(
          listener: (context, state) {
            if (state is SignInFailureState) {
              showFailureSnackBar(context, message: state.message);
            }

            if (state is SignInSuccessState) {
              Prefs.setData(alreadySignIn, true);
              showSuccessSnackBar(context, message: "Signed in successfully");
              Navigator.pushReplacementNamed(context, Routes.homePage);
            }
          },
          builder: (context, state) {
            return CustomProgressHud(
              isLoading: state is SignInLoadingState,
              child: const SignInPageBody(),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/di/get_it.dart';
import 'package:spotify_app/core/widgets/app_bar.dart';
import '../../../../core/widgets/custom_progress_hud.dart';
import '../cubit/sign_up_cubit/sign_up_cubit.dart';
import '../cubit/sign_up_cubit/sign_up_states.dart';
import '../widgets/sign_up_widgets/sign_up_page_body.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(withLogo: true),
      body: BlocProvider(
        create: (context) => ServiceLocator.di.get<SignUpCubit>(),
        child: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }

            if (state is SignUpSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${state.userEntity.email} Signed up successfully"),
                ),
              );
            }
          },
          builder: (context, state) {
            return CustomProgressHud(
              isLoading: state is SignUpLoadingState,
              child: const SignUpPageBody(),
            );
          },
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_images.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_vectors.dart';
import '../../../../core/widgets/app_button.dart';
import '../cubit/choose_mode_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.chooseModeBG),
                fit: BoxFit.fill,

              ),
            ),
            child: Column(
              children: [
                SvgPicture.asset(AppVectors.appLogo),
                const Spacer(),
                const Text(
                  "Choose Mode",
                  style: TextStyles.font22Bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 31),
                BlocBuilder<ChooseModeCubit, ThemeMode>(
                  builder: (context, mode) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                context
                                    .read<ChooseModeCubit>()
                                    .changeMode(ThemeMode.dark);
                              },
                              child: _buildCircleIcon(
                                context,
                                imagePath: AppVectors.chooseModeMoon,
                                isClicked: mode == ThemeMode.dark,
                              ),
                            ),
                            const Text(
                              'Dark Mode',
                              style: TextStyles.font17Medium,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                context
                                    .read<ChooseModeCubit>()
                                    .changeMode(ThemeMode.light);
                              },
                              child: _buildCircleIcon(
                                context,
                                imagePath: AppVectors.chooseModeSun,
                                isClicked: mode == ThemeMode.light,
                              ),
                            ),
                            const Text(
                              'Light Mode',
                              style: TextStyles.font17Medium,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 68),
                AppButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signInAndSignUpPage);
                  },
                  text: 'Continue',
                ),
              ],
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: Container(
              color: Colors.black.withOpacity(0.15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIcon(BuildContext context,
      {required String imagePath, required bool isClicked}) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 73,
          height: 73,
          decoration: BoxDecoration(
            color: isClicked
                ? AppColors.primaryColor
                : const Color(0xFF30393C).withOpacity(.5),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            imagePath,
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}

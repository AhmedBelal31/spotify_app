import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/app_images.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_vectors.dart';
import '../../../../core/widgets/app_button.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  Widget _buildCircleIcon(String imagePath ) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 73,
          height: 73,
          decoration: BoxDecoration(
            color: const Color(0xFF30393C).withOpacity(.5),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(imagePath, fit: BoxFit.none,),
        ),
      ),
    );
  }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        _buildCircleIcon(AppVectors.chooseModeMoon ),
                        const Text(
                          'Dark Mode',
                          style: TextStyles.font17Medium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        _buildCircleIcon(AppVectors.chooseModeSun ),
                        const Text(
                          'Light Mode',
                          style: TextStyles.font17Medium,
                        ),
                      ],
                    ),

                  ],
                ),
                const SizedBox(height: 68),
                AppButton(
                  onPressed: () {
                    Navigator.pop(context);
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
}

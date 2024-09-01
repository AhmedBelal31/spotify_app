import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/theme/app_images.dart';
import 'package:spotify_app/core/theme/app_vectors.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.getStartedBG),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SvgPicture.asset(AppVectors.appLogo),
                const Spacer(),
                const Text('Enjoy Listening to Music', style: TextStyles.font22Bold),
                const SizedBox(height: 21),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
                  style: TextStyles.font17Regular
                      .copyWith(color: AppColors.greyColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 37),
                AppButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.chooseModePage);
                  },
                  text: 'Get Started',
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

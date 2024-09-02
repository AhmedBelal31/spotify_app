import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/core/extensions/is_dark_mode.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Already Have An Account? ',
        style: TextStyles.font15Regular.copyWith(
          color: context.isDarkMode ? Colors.white : Colors.black,
        ),
        children: [
          TextSpan(
              text: 'Sign In',
              style: TextStyles.font16Medium.copyWith(
                color: AppColors.primaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed(Routes.signInPage);
                })
        ],
      ),
    );
  }
}

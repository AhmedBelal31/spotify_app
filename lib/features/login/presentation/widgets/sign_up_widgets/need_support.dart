import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class NeedSupport extends StatelessWidget {
  const NeedSupport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'If You Need Any Support ',
        style: TextStyles.font14Regular.copyWith(color: AppColors.greyColor),
        children: [
          TextSpan(
            text: 'Click Here',
            style: TextStyles.font15Regular
                .copyWith(color: AppColors.primaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigator.of(context).pushNamed(Routes.getStartedPage);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.primaryColor,
                    content: Text(
                      'الي بيساعد ربنا ',
                      style:
                          TextStyles.font19Medium.copyWith(color: Colors.white),
                    ),
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}

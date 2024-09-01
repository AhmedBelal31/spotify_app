import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double? height;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.font22Bold,
      ),
    );
  }
}

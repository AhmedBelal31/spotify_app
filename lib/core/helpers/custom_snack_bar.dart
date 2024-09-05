import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../theme/app_colors.dart';

void showSuccessSnackBar(BuildContext context, {required String message}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
      backgroundColor: AppColors.primaryColor,
    ),
  );
}

void showFailureSnackBar(BuildContext context, {required String message}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
      backgroundColor: Colors.red,
    ),
  );
}

void showInformationSnackBar(BuildContext context, {required String message}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(
      message: message,
      backgroundColor: Colors.blue,
    ),
  );
}

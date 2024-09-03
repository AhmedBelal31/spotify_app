import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../theme/app_colors.dart';

class CustomProgressHud extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const CustomProgressHud(
      {super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
      child: child,
    );
  }
}

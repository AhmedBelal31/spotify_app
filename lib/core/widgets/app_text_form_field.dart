import 'package:flutter/material.dart';
import 'package:spotify_app/core/extensions/is_dark_mode.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppTextFormField extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function()? suffixOnPressed;
  final bool? isThereASuffix;
  final TextEditingController? controller;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.onFieldSubmitted,
    this.suffixOnPressed,
    this.isThereASuffix = false,
    this.controller,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: isVisible,
      cursorColor: context.isDarkMode ? Colors.white : Colors.black,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyles.font16Medium.copyWith(
          color: context.isDarkMode
              ? AppColors.textFieldTextDarkColor
              : AppColors.textFieldTextLightColor,
        ),
        suffixIcon: widget.isThereASuffix == false
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: isVisible
                      ? Icon(
                          Icons.visibility,
                          color: context.isDarkMode
                              ? const Color(0xFF5B5B5B)
                              : const Color(0xff8D8D8D),
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: context.isDarkMode
                              ? const Color(0xFF5B5B5B)
                              : const Color(0xff8D8D8D),
                        ),
                ),
              ),
        contentPadding: const EdgeInsets.all(30),
        border: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(
          borderColor: context.isDarkMode ? Colors.white : Colors.black,
          borderWidth: 2,
        ),
        enabledBorder: _buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(
      {Color? borderColor, double borderWidth = 1}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: borderWidth,
        color: borderColor ?? AppColors.greyColor,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/extensions/is_dark_mode.dart';
import 'package:spotify_app/core/theme/app_vectors.dart';
import '../theme/app_text_styles.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool withLogo;
  final String text;
  final Widget? trailing;

  const BasicAppBar(
      {super.key, this.withLogo = false, this.text = '', this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode
                ? Colors.white.withOpacity(.07)
                : Colors.black.withOpacity(.04),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      title: withLogo
          ? SvgPicture.asset(AppVectors.appLogo, width: 108)
          : Text(
              text,
              style: TextStyles.font16Bold,
            ),
      centerTitle: true,
      actions: [
        trailing ?? const SizedBox(),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

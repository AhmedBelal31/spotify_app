import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_vectors.dart';

class SongInfo extends StatelessWidget {
  const SongInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextInfo(),
        const Spacer(), //
        SvgPicture.asset(
          AppVectors.homeTopPattern,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  Column buildTextInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New Album',
          style: TextStyles.font10Medium.copyWith(
            color: Colors.white,
          ),
        ),
        Text(
          'Happier Than \nEver',
          style: TextStyles.font20Bold.copyWith(color: Colors.white),
        ),
        Text(
          'Billie Eilish',
          style: TextStyles.font12Medium.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

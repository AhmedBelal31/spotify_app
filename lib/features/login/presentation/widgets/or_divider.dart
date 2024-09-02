import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin:  const EdgeInsets.only(top: 5),
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey[700]!,
                  Colors.grey[500]!,
                  Colors.grey[200]!,
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
              'Or',
              style: TextStyles.font15Regular.copyWith(
                color: Colors.grey
              )
          ),
        ),
        Expanded(
          child: Container(
            margin:  const EdgeInsets.only(top: 5),
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Color(0xFF5B5B5B),
                  // Color(0xFF252525),
                  Colors.grey[700]!,
                  Colors.grey[500]!,
                  Colors.grey[200]!,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

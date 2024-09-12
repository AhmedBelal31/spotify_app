import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_images.dart';
import 'song_info.dart';



class HomeArtistCard extends StatelessWidget {
  const HomeArtistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 118,
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const SongInfo(),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 15,
              child: Image.asset(
                AppImages.homeArtist,
                height: 183,
                // Adjust size so that the image fits within the card
                fit: BoxFit
                    .none, // Ensure the image fits without getting cut off
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/extensions/is_dark_mode.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/widgets/app_bar.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_vectors.dart';
import '../../../choose_mode/presentation/cubit/choose_mode_cubit.dart';
import '../widgets/home_artist_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 210.h,
              child: Stack(
                children: [
                  BasicAppBar(
                    showBackButton: false,
                    leading: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppVectors.searchIcon,
                        colorFilter: ColorFilter.mode(
                          context.isDarkMode ? Colors.white : Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    withLogo: true,
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          final currentMode =
                              context.read<ChooseModeCubit>().state;
                          final newMode = currentMode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                          context.read<ChooseModeCubit>().changeMode(newMode);
                        });
                      },
                      icon: const Icon(Icons.brightness_3_outlined),
                    ),
                  ),
                  const Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    child: IgnorePointer(
                      ignoring: true,
                      child: HomeArtistCard(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SectionsTabs(controller: _tabController),
            // Pass the TabController here
            SizedBox(
              height: 400.h, // Set height for TabBarView content
              child: TabBarView(
                controller: _tabController,
                // Use the same TabController for TabBarView
                physics: const BouncingScrollPhysics(),
                children: const [
                  HomeArtistCard(),
                  // You can add other content here for each tab
                  HomeArtistCard(),
                  HomeArtistCard(),
                  HomeArtistCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionsTabs extends StatelessWidget {
  final TabController controller;

  const SectionsTabs({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      dividerColor: Colors.transparent,
      indicatorColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.greyColor,
      labelStyle: TextStyles.font16Medium,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.symmetric(vertical: -3.h, horizontal: 8.w),
      tabs: const [
        Text('News'),
        Text('Video'),
        Text('Artists'),
        Text('Podcasts'),
      ],
    );
  }
}

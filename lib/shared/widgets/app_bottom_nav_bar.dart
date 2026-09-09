import 'package:flutter/material.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart'
    hide AppColors;
import 'package:social_app/core/constants/app_sizes.dart';
import 'package:social_app/core/constants/app_strings.dart';
import 'package:social_app/core/theme/app_colors.dart';
class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  final int currentIndex;
  final ValueChanged<int> onIndexChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      barColor: AppColors.white,

      controller: FloatingBottomBarController(
        initialIndex: currentIndex,
      ),

      bottomBar: [
        // Home
        BottomBarItem(
          icon: const Icon(
            Icons.home_outlined,
            size: AppSizes.iconLarge,
            color: AppColors.textSecondary,
          ),
          iconSelected: const Icon(
            Icons.home,
            size: AppSizes.iconLarge,
            color: AppColors.primary,
          ),
          title: AppStrings.home,
          dotColor: AppColors.primary,
          onTap: (value) {
            onIndexChanged(value);
          },
        ),

        // Discover
        BottomBarItem(
          icon: const Icon(
            Icons.grid_view_outlined,
            size: AppSizes.iconLarge,
            color: AppColors.textSecondary,
          ),
          iconSelected: const Icon(
            Icons.grid_view_rounded,
            size: AppSizes.iconLarge,
            color: AppColors.primary,
          ),
          title: AppStrings.discover,
          dotColor: AppColors.primary,
          onTap: (value) {
            onIndexChanged(value);
          },
        ),

        // Activity
        BottomBarItem(
          icon: const Icon(
            Icons.notifications_none_outlined,
            size: AppSizes.iconLarge,
            color: AppColors.textSecondary,
          ),
          iconSelected: const Icon(
            Icons.notifications,
            size: AppSizes.iconLarge,
            color: AppColors.primary,
          ),
          title: AppStrings.activity,
          dotColor: AppColors.primary,
          onTap: (value) {
            onIndexChanged(value);
          },
        ),

        // Profile
        BottomBarItem(
          icon: const Icon(
            Icons.person_outline,
            size: AppSizes.iconLarge,
            color: AppColors.textSecondary,
          ),
          iconSelected: const Icon(
            Icons.person,
            size: AppSizes.iconLarge,
            color: AppColors.primary,
          ),
          title: AppStrings.profile,
          dotColor: AppColors.primary,
          onTap: (value) {
            onIndexChanged(value);
          },
        ),
      ],

      // Center +
      bottomBarCenterModel: BottomBarCenterModel(
        centerBackgroundColor: AppColors.primary,

        // Main +
        centerIcon: const FloatingCenterButton(
          child: Icon(
            Icons.add,
            color: AppColors.white,
            size: AppSizes.iconLarge,
          ),
        ),

        // Actions that appear after pressing +
        centerIconChild: [
          FloatingCenterButtonChild(
            child: const Icon(
              Icons.add_photo_alternate_outlined,
              color: AppColors.white,
            ),
            onTap: () {
              debugPrint('Create post');
            },
          ),

          FloatingCenterButtonChild(
            child: const Icon(
              Icons.emoji_events_outlined,
              color: AppColors.white,
            ),
            onTap: () {
              debugPrint('Create challenge');
            },
          ),
        ],
      ),
    );
  }
}
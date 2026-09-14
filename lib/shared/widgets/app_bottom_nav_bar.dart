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

  Widget _buildNavItem({
    required IconData iconData,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: AppSizes.iconLarge,
          color: color,
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white, // ملء أي فراغ مقتطع
      child: AnimatedBottomNavigationBar(
        barColor: AppColors.white,
        controller: FloatingBottomBarController(
          initialIndex: currentIndex,
        ),
        bottomBar: [
          // Home
          BottomBarItem(
            title: '',
            icon: _buildNavItem(
              iconData: Icons.home_outlined,
              label: AppStrings.home,
              color: AppColors.textSecondary,
            ),
            iconSelected: _buildNavItem(
              iconData: Icons.home,
              label: AppStrings.home,
              color: AppColors.primary,
            ),
            dotColor: Colors.transparent,
            onTap: (value) {
              onIndexChanged(value);
            },
          ),

          // Discover
          BottomBarItem(
            title: '',
            icon: _buildNavItem(
              iconData: Icons.grid_view_outlined,
              label: AppStrings.discover,
              color: AppColors.textSecondary,
            ),
            iconSelected: _buildNavItem(
              iconData: Icons.grid_view_rounded,
              label: AppStrings.discover,
              color: AppColors.primary,
            ),
            dotColor: Colors.transparent,
            onTap: (value) {
              onIndexChanged(value);
            },
          ),

          // Activity
          BottomBarItem(
            title: '',
            icon: _buildNavItem(
              iconData: Icons.notifications_none_outlined,
              label: AppStrings.activity,
              color: AppColors.textSecondary,
            ),
            iconSelected: _buildNavItem(
              iconData: Icons.notifications,
              label: AppStrings.activity,
              color: AppColors.primary,
            ),
            dotColor: Colors.transparent,
            onTap: (value) {
              onIndexChanged(value);
            },
          ),

          // Profile
          BottomBarItem(
            title: '',
            icon: _buildNavItem(
              iconData: Icons.person_outline,
              label: AppStrings.profile,
              color: AppColors.textSecondary,
            ),
            iconSelected: _buildNavItem(
              iconData: Icons.person,
              label: AppStrings.profile,
              color: AppColors.primary,
            ),
            dotColor: Colors.transparent,
            onTap: (value) {
              onIndexChanged(value);
            },
          ),
        ],

        // Center +
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: AppColors.primary,
          centerIcon: const FloatingCenterButton(
            child: Icon(
              Icons.add,
              color: AppColors.white,
              size: AppSizes.iconLarge,
            ),
          ),
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
      ),
    );
  }
}
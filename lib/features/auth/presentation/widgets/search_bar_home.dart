import 'package:flutter/material.dart';
import 'package:social_app/core/constants/app_sizes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';

class SearchBarHome extends StatelessWidget {
  final VoidCallback? onTap;

  const SearchBarHome({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: AbsorbPointer(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: AppColors.primary),
                      const SizedBox(width: AppSizes.sm),
                      Text(
                        'Search',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSizes.sm),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: AppColors.inputBackground,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.near_me_outlined,
                color: AppColors.textPrimary,
                size: 24,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
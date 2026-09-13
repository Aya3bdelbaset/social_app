import 'package:flutter/material.dart';
import 'package:social_app/core/constants/app_sizes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';

class SelectCategoryCard extends StatelessWidget {
  const SelectCategoryCard({
    super.key,
    required this.title,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final Widget image;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radiusLg - 2.5),
          child: Stack(
            fit: StackFit.expand,
            children: [
              image,
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(AppSizes.md),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
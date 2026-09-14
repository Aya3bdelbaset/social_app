import 'package:flutter/material.dart';
import 'package:social_app/core/constants/app_sizes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/features/auth/presentation/widgets/search_bar_home.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: AppSizes.avatarSmall),

            // 1. Search Bar
            const SearchBarHome(),

            const SizedBox(height: AppSizes.md),

            // 2. Discover Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.lg,
                  vertical: AppSizes.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Topic Header ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Topic',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View more',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.md),

                    // --- Topic Cards ---
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          _TopicCard(
                            title: 'PHOTOGRAPHY',
                            imagePath: 'assets/images/Thanh Pham.png',
                          ),
                          SizedBox(width: AppSizes.sm),
                          _TopicCard(
                            title: 'UI DESIGN',
                            imagePath: 'assets/images/Bruno.png',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSizes.xl),

                    // --- Collection Header ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Collection',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View more',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.md),

                    // --- Collection Cards ---
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          _CollectionCard(
                            title: 'PORTRAIT\nPHOTOGRAPHY',
                            subtitle: '70 photos',
                            imagePath: 'assets/images/Thanh Pham.png',
                          ),
                          SizedBox(width: AppSizes.sm),
                          _CollectionCard(
                            title: 'MUSIC VIDEO',
                            subtitle: '10 videos',
                            imagePath: 'assets/images/Bruno.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// Topic Card Widget
// -------------------------------------------------------------
class _TopicCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const _TopicCard({
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// Collection Card Widget
// -------------------------------------------------------------
class _CollectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const _CollectionCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:social_app/core/constants/app_sizes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';

class CollectionSectionDiscover extends StatelessWidget {
  final String sectionTitle;

  const CollectionSectionDiscover({
    super.key,
    this.sectionTitle = 'Collection',
  });

  final List<Map<String, String>> collections = const [
    {
      'title': 'PORTRAIT\nPHOTOGRAPHY',
      'subtitle': '70 photos',
      'image': 'assets/images/portrait photography.png',
    },
    {
      'title': 'MUSIC VIDEO',
      'subtitle': '10 videos',
      'image': 'assets/images/music video.png',
    },
    {
      'title': 'PORTRAIT\nPHOTOGRAPHY',
      'subtitle': '70 photos',
      'image': 'assets/images/portrait photography.png',
    },
    {
      'title': 'MUSIC VIDEO',
      'subtitle': '10 videos',
      'image': 'assets/images/music video.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionTitle,
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

        // Horizontal Scrollable Cards List
        SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: collections.length,
            separatorBuilder: (context, index) => const SizedBox(width: AppSizes.md),
            itemBuilder: (context, index) {
              return _CollectionCard(
                title: collections[index]['title']!,
                subtitle: collections[index]['subtitle']!,
                imagePath: collections[index]['image']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

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
        // image and text
        Expanded(
          child: Container(
            width: 150,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 1.0,
                    height: 1.3,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),
        
        Text(
          subtitle,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary.withOpacity(0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:social_app/core/constants/app_sizes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';

class TopicSectionDiscover extends StatelessWidget {
  const TopicSectionDiscover({super.key});

  final List<Map<String, String>> topics = const [
    {'title': 'PHOTOGRAPHY', 'image': 'assets/images/photography.png'},
    {'title': 'UI DESIGN', 'image': 'assets/images/ui design.png'},
    {'title': 'ILLUSTRATION', 'image': 'assets/images/illustration.png'},
    {'title': 'MAKING VIDEO', 'image': 'assets/images/making video.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Topic',
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 24,
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

        SizedBox(
          height: 140, 
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: topics.length,
            separatorBuilder: (context, index) => const SizedBox(width: AppSizes.md),
            itemBuilder: (context, index) {
              return _TopicCard(
                title: topics[index]['title']!,
                imagePath: topics[index]['image']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

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
      height: 140,
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
          ),
        ),
      ),
    );
  }
}
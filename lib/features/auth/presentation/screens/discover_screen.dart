import 'package:flutter/material.dart';
import 'package:social_app/core/constants/app_sizes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/features/auth/presentation/screens/search_screen.dart';
import 'package:social_app/features/auth/presentation/widgets/collection_section_discover.dart';
import 'package:social_app/features/auth/presentation/widgets/search_bar_home.dart';
import 'package:social_app/features/auth/presentation/widgets/topic_section_dicover.dart';

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

            SearchBarHome(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
            ),

            const SizedBox(height: AppSizes.md),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.xxl,
                  vertical: AppSizes.sm,
                ),
                child: Column(
                  children: const [
                    TopicSectionDiscover(),

                    SizedBox(height: AppSizes.xl),

                    CollectionSectionDiscover(),

                    SizedBox(height: AppSizes.xl),

                    CollectionSectionDiscover(),
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
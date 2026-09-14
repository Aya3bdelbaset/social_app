import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/core/constants/app_sizes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/features/auth/presentation/screens/search_screen.dart';
import 'package:social_app/features/auth/presentation/widgets/post_card_home.dart';
import 'package:social_app/features/auth/presentation/widgets/search_bar_home.dart';
import 'package:social_app/features/auth/presentation/widgets/tab_bar_home.dart'; // Import
import 'package:social_app/features/models/post_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<PostModel> posts = const [
    PostModel(
      userName: 'Thanh Pham',
      userImage: 'assets/images/image thanh pham.png',
      postImage: 'assets/images/Thanh Pham.png',
      timeAgo: '1 hour ago',
      commentsCount: 20,
      likesCount: 125,
    ),
    PostModel(
      userName: 'Bruno',
      userImage: 'assets/images/image bruno.png',
      postImage: 'assets/images/Bruno.png',
      timeAgo: '1 hour ago',
      commentsCount: 15,
      likesCount: 89,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: AppSizes.avatarSmall),

              // 1. Search Bar
              SearchBarHome(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: AppSizes.lg),

              // 2. Tabs
              const TabBarHome(),

              const SizedBox(height: AppSizes.xs),

              // 3. Posts List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.lg,
                    vertical: AppSizes.md,
                  ),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return PostCard(post: posts[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
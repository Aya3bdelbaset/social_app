import 'package:flutter/material.dart';
import 'package:social_app/core/constants/app_sizes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/features/auth/presentation/widgets/search_bar_section.dart';
import 'package:social_app/features/auth/presentation/widgets/search_category_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearching = false;

  final List<Map<String, dynamic>> searchCategories = const [
    {'title': 'PHOTOGRAPHY', 'image': 'assets/images/photography serach.png', 'alignRight': false},
    {'title': 'ILLUSTRATION', 'image': 'assets/images/illustration search.png', 'alignRight': true},
    {'title': 'DESIGN', 'image': 'assets/images/design search.png', 'alignRight': false},
    {'title': 'MAKING VIDEO', 'image': 'assets/images/making video search.png', 'alignRight': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: AppSizes.avatarSmall),

              SearchBarSection(
                isSearching: isSearching,
                onTapSearch: () {
                  setState(() {
                    isSearching = true;
                  });
                },
                onCancel: () {
                  setState(() {
                    isSearching = false;
                  });
                },
              ),

              const SizedBox(height: AppSizes.xl),

              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: searchCategories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16.0),
                  itemBuilder: (context, index) {
                    final item = searchCategories[index];
                    return SearchCategoryCard(
                      title: item['title']!,
                      imagePath: item['image']!,
                      alignRight: item['alignRight'] as bool,
                    );
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
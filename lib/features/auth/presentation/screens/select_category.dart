import 'package:flutter/material.dart';
import 'package:social_app/core/constants/app_assets.dart';
import 'package:social_app/core/routes/route_names.dart';
import 'package:social_app/features/models/category.dart';
import 'package:social_app/features/auth/presentation/widgets/category_card.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({super.key});

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  int? _selectedCategory;

  final List<CategoryItem> _categories = const [
    CategoryItem(
      title: '',
      image: AppAssets.photographer,
    ),
    CategoryItem(
      title: 'Video Creator',
      image: AppAssets.videocreator,
    ),
    CategoryItem(
      title: 'Illustrator',
      image: AppAssets.illustrator,
    ),
    CategoryItem(
      title: 'Designer',
      image: AppAssets.designer,
    ),
  ];

  void _onCategorySelected(int index) {
    setState(() {
      _selectedCategory = index;
    });
  }

  // هنا التعديل
  void _onExplorePressed() {
    if (_selectedCategory == null) return;

    Navigator.pushReplacementNamed(
      context,
      RouteNames.mainLayout, // غيرناها هنا من home إلى mainLayout
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 149,
            width: double.infinity,
            child: ClipPath(
              clipper: _HeaderClipper(),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    AppAssets.iclick,
                    fit: BoxFit.cover,
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 76.7),
                      child: Text(
                        'i.click',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Who are you?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 5, 5),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.86,
                      ),
                      itemBuilder: (context, index) {
                        final category = _categories[index];

                        return CategoryCard(
                          title: category.title,
                          image: category.image,
                          isSelected: _selectedCategory == index,
                          onTap: () => _onCategorySelected(index),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'SHARE - INSPIRE - CONNECT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                        color: Color(0xFF5151C6),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 215,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF5151C6),
                              Color(0xFF888BF4),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          onPressed: _selectedCategory == null
                              ? null
                              : _onExplorePressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            disabledBackgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'EXPLORE NOW',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 22);

    path.quadraticBezierTo(
      size.width * 0.5,
      size.height + 18,
      size.width,
      size.height - 22,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
import 'package:flutter/material.dart';
import 'package:social_app/core/theme/app_colors.dart';

class SearchBarSection extends StatelessWidget {
  final bool isSearching;
  final VoidCallback onTapSearch;
  final VoidCallback onCancel;

  const SearchBarSection({
    super.key,
    required this.isSearching,
    required this.onTapSearch,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isSearching
          ? Row(
              key: const ValueKey(2),
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColors.primary, // استروك أزرق ثابت وواضح
                        width: 1.5,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.deepPurple),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: 'Type something',
                              // 👇 هنا المكان اللي بتغير منه لون وكلاس الـ Hint Text
                              hintStyle: TextStyle(
                                color: Colors.grey, // تقدر تغير اللون من هنا بسهولة
                                fontSize: 15,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: onCancel,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            )
          : GestureDetector(
              key: const ValueKey(1),
              onTap: onTapSearch,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.deepPurple),
                    const SizedBox(width: 10),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
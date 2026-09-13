import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SelectCategoryHeader extends StatelessWidget {
  const SelectCategoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/select category header.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              'i.click',
              style: AppTextStyles.heading1.copyWith(
                color: AppColors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
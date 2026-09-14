import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/features/auth/presentation/widgets/challenge_header_section.dart';
import 'package:social_app/features/auth/presentation/widgets/challenge_details_section.dart';
import 'package:social_app/features/auth/presentation/widgets/challenge_content_section.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ChallengeHeaderSection(),
              SizedBox(height: 45),
              ChallengeDetailsSection(),
              SizedBox(height: 32),
              ChallengeContentSection(),
            ],
          ),
        ),
      ),
    );
  }
}
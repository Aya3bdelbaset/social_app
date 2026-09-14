import 'package:flutter/material.dart';
import 'package:social_app/features/auth/presentation/screens/forget_password.dart';
import 'package:social_app/features/auth/presentation/screens/main_layout_screen.dart'; // <--- Import
import 'package:social_app/features/auth/presentation/screens/select_category.dart';
import 'package:social_app/features/auth/presentation/screens/set_new_password.dart';
import 'package:social_app/features/auth/presentation/screens/sign_in.dart';
import 'package:social_app/features/auth/presentation/screens/onboarding.dart';
import 'package:social_app/features/auth/presentation/screens/sign_up.dart';
import 'package:social_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:social_app/features/auth/presentation/screens/verify_screen.dart';

import 'route_names.dart';

abstract final class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case RouteNames.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
          settings: settings,
        );

      case RouteNames.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
          settings: settings,
        );
        
      case RouteNames.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
          settings: settings,
        );

      case RouteNames.verify:
        return MaterialPageRoute(
          builder: (_) => const VerifyScreen(),
          settings: settings,
        );

      case RouteNames.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
          settings: settings,
        );

      case RouteNames.setNewPassword:
        return MaterialPageRoute(
          builder: (_) => const SetNewPasswordScreen(),
          settings: settings,
        );

      case RouteNames.selectcategory:
        return MaterialPageRoute(
          builder: (_) => const SelectCategoryScreen(),
          settings: settings,
        );

      // <--- أضف حالة الـ mainLayout هنا
      case RouteNames.mainLayout:
        return MaterialPageRoute(
          builder: (_) => const MainLayoutScreen(),
          settings: settings,
        );

      case RouteNames.activity:
        return _placeholderRoute(settings, 'Activity');

      case RouteNames.profile:
        return _placeholderRoute(settings, 'Profile');

      case RouteNames.messages:
        return _placeholderRoute(settings, 'Messages');

      default:
        return _placeholderRoute(settings, 'Not Found');
    }
  }

  static MaterialPageRoute<void> _placeholderRoute(
    RouteSettings settings,
    String title,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => Scaffold(body: Center(child: Text(title))),
    );
  }
}
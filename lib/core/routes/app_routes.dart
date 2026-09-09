import 'package:flutter/material.dart';

import 'route_names.dart';

abstract final class AppRoutes {
  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case RouteNames.splash:
        return _placeholderRoute(settings, 'Splash');

      case RouteNames.signIn:
        return _placeholderRoute(settings, 'Sign In');

      case RouteNames.signUp:
        return _placeholderRoute(settings, 'Sign Up');

      case RouteNames.home:
        return _placeholderRoute(settings, 'Home');

      case RouteNames.discover:
        return _placeholderRoute(settings, 'Discover');

      case RouteNames.challenge:
        return _placeholderRoute(settings, 'Challenge');

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
      builder: (_) => Scaffold(
        body: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/routes/route_names.dart';
import 'package:social_app/features/auth/presentation/screens/main_layout_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.mainLayout,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home: const MainLayoutScreen(),
    );
  }
}
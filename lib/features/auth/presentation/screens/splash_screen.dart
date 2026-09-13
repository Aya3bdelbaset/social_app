import 'package:flutter/material.dart';

import 'package:social_app/core/constants/app_assets.dart';
import 'package:social_app/core/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;

        Navigator.pushReplacementNamed(
          context,
          RouteNames.onboarding,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              AppAssets.background,
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Image.asset(
              AppAssets.logo,
              width: 345,
              fit: BoxFit.contain,
            ),
          ),

     
          Positioned(
            top: 121,
            left: 0,
            right: 0,
            child: const Text(
              'i.click',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
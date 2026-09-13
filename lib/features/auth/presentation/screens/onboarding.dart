import 'package:flutter/material.dart';

import 'package:social_app/core/constants/app_assets.dart';
import 'package:social_app/core/routes/route_names.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(AppAssets.background, fit: BoxFit.cover),
          ),

         
          Positioned(
            top: 136,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                AppAssets.logo,
                width: 345,
                fit: BoxFit.contain,
              ),
            ),
          ),

         
          Positioned(
            top: 70,
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

          
          Positioned(
            left: 0,
            right: 0,
            bottom: 240,

            child: const Text(
              'SHARE - INSPIRE - CONNECT',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(192, 255, 255, 255),
              ),
            ),
          ),

          
          Positioned(
            left: 120,
            right: 120,
            bottom: 150,
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RouteNames.signIn);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(52, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(238, 255, 255, 255),
                  minimumSize: const Size(98, 32),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'GET STARTED',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

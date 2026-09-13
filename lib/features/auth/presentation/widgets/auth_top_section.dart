import 'package:flutter/material.dart';

class AuthTopSection extends StatelessWidget {
  final String imagePath;
  final double height;

  const AuthTopSection({
    super.key,
    this.imagePath = 'assets/images/authpic.png',
    this.height = 260,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          Container(color: Colors.black.withValues(alpha: 0.25)),

        
        ],
      ),
    );
  }
}
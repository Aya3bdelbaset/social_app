import 'package:flutter/material.dart';
class AuthBottomDecoration extends StatelessWidget {
  final Widget child;
  final double overlap;
  final double borderRadius;

  const AuthBottomDecoration({
    super.key,
    required this.child,
    this.overlap = 30,
    this.borderRadius = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -overlap),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
        ),
        child: child,
      ),
    );
  }
}
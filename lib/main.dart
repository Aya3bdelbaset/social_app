import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/social_app.dart';

void main () {
  SystemChrome.setSystemUIOverlayStyle(
    
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(SocialApp());
}
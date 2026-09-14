import 'package:flutter/material.dart';
import 'package:social_app/features/auth/presentation/screens/discover_screen.dart';
import 'package:social_app/shared/widgets/app_bottom_nav_bar.dart';

import 'home_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

  // القائمة التي تحتوي على الشاشات الأربعة التي يتنقل بينها الـ Nav Bar
  final List<Widget> _screens = const [
    HomeScreen(), // 0: Home
    DiscoverScreen(),
    Scaffold(body: Center(child: Text('Activity Screen'))), // 2: Activity
    Scaffold(body: Center(child: Text('Profile Screen'))),  // 3: Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _currentIndex,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
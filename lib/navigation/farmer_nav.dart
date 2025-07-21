import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../views/marketplace/marketplace.dart';
import '../views/smart_assistant/smart_assistant_screen.dart';
import '../views/profile/profile_screen.dart';
import '../theme/colors.dart'; // You can define your app colors here

class FarmerNav extends StatefulWidget {
  const FarmerNav({super.key});

  @override
  State<FarmerNav> createState() => _FarmerNavState();
}

class _FarmerNavState extends State<FarmerNav> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MarketplaceScreen(),
    SmartAssistantScreen(),
    ProfileScreen(),
  ];

  final List<String> _titles = [
    'Marketplace',
    'Smart Assistant',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: AppColors.card,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textMuted,
          selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          unselectedLabelStyle: GoogleFonts.poppins(),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined),
              label: 'Marketplace',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome),
              label: 'Assistant',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

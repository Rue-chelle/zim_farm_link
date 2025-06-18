import 'package:flutter/material.dart';
import 'views/home_screen.dart';
import 'screens/marketplace_screen.dart';
import 'screens/add_listing_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/ai_assistant_screen.dart';
import 'widgets/custom_navbar.dart';

void main() {
  runApp(const ZimFarmLinkApp());
}

class ZimFarmLinkApp extends StatefulWidget {
  const ZimFarmLinkApp({super.key});

  @override
  State<ZimFarmLinkApp> createState() => _ZimFarmLinkAppState();
}

class _ZimFarmLinkAppState extends State<ZimFarmLinkApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    MarketplaceScreen(),
    AddListingScreen(),
    AiAssistantScreen(),
    ProfileScreen(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZimFarmLink',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // Auto dark mode
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: CustomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onNavTapped,
        ),
      ),
    );
  }
}

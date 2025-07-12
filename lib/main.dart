import 'package:flutter/material.dart';
import 'views/home/home_screen.dart';
import 'views/marketplace/marketplace_screen.dart';
import 'views/marketplace/add_listing_screen.dart';
import 'views/assistant/assistant_screen.dart';
import 'views/profile/profile_screen.dart';
import 'views/ngo/ngo_dashboard_screen.dart';
import 'widgets/custom_navbar.dart';
import 'db/local_db.dart';

void main() {
  runApp(const ZimFarmLinkApp());
}

class ZimFarmLinkApp extends StatefulWidget {
  const ZimFarmLinkApp({super.key});

  @override
  State<ZimFarmLinkApp> createState() => _ZimFarmLinkAppState();
}

class _ZimFarmLinkAppState extends State<ZimFarmLinkApp> {
  final db = LocalDatabase();
  int _selectedIndex = 0;
  String _userRole = 'user'; // default role

  final List<Widget> _allScreens = [
    const HomeScreen(),
    const MarketplaceScreen(),
    const AddListingScreen(),
    const AssistantScreen(),
    const ProfileScreen(),
    const NGODashboardScreen(), // index 5 (only shown if user has role)
  ];

  @override
  void initState() {
    super.initState();
    _fetchUserRole();
    // Optional for testing
    // seedNgoUser(db);
  }

  Future<void> _fetchUserRole() async {
    final users = await db.getUserProfiles();
    if (users.isNotEmpty) {
      setState(() {
        _userRole = users.first.role;
      });
    }
  }

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = (_userRole == 'ngo' || _userRole == 'admin')
        ? _allScreens
        : _allScreens.sublist(0, 5); // Hide NGO screen if not permitted

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZimFarmLink',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: CustomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onNavTapped,
          showNgoTab: (_userRole == 'ngo' || _userRole == 'admin'),
        ),
      ),
    );
  }
}

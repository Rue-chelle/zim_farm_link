import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../home/home_screen.dart';
import '../marketplace/marketplace_screen.dart';
import '../marketplace/add_listing_screen.dart';
import '../assistant/assistant_screen.dart';
import '../profile/profile_screen.dart';
import '../../widgets/custom_navbar.dart';

class MainAppShell extends StatefulWidget {
  const MainAppShell({super.key});

  @override
  State<MainAppShell> createState() => _MainAppShellState();
}

class _MainAppShellState extends State<MainAppShell> {
  int _selectedIndex = 0;
  String _userRole = 'user';

  final List<Widget> _allScreens = [
    const HomeScreen(),
    const MarketplaceScreen(),
    const AddListingScreen(),
    const SmartAssistantScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _fetchUserRoleFromSupabase();
  }

  Future<void> _fetchUserRoleFromSupabase() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    if (user != null) {
      final response = await supabase
          .from('UserProfiles')
          .select('role')
          .eq('user_id', user.id)
          .single();

      if (response != null && response['role'] != null) {
        setState(() {
          _userRole = response['role'];
        });
      }
    }
  }

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final showNgoTab = (_userRole == 'ngo' || _userRole == 'admin');
    final screensToShow = showNgoTab ? _allScreens : _allScreens.sublist(0, 5);

    return Scaffold(
      body: screensToShow[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onNavTapped,
        showNgoTab: showNgoTab,
      ),
    );
  }
}

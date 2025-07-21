import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'views/home/home_screen.dart';
import 'views/marketplace/marketplace_screen.dart';
import 'views/marketplace/add_listing_screen.dart';
import 'views/assistant/assistant_screen.dart';
import 'views/profile/profile_screen.dart';
import 'widgets/custom_navbar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://your-project-id.supabase.co', // replace with your project URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhqYXpzZ29hcGNjb2Z0c2xvbXVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI3NTAyMDcsImV4cCI6MjA2ODMyNjIwN30.AY-hwH_p-MN7cLZ29M2EGkSscf9aSAtEszCIRUOqhCQ', 
  );

  runApp(const ZimFarmLinkApp());
}

class ZimFarmLinkApp extends StatefulWidget {
  const ZimFarmLinkApp({super.key});

  @override
  State<ZimFarmLinkApp> createState() => _ZimFarmLinkAppState();
}

class _ZimFarmLinkAppState extends State<ZimFarmLinkApp> {
  int _selectedIndex = 0;
  String _userRole = 'user'; // default role

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
        body: screensToShow[_selectedIndex],
        bottomNavigationBar: CustomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onNavTapped,
          showNgoTab: showNgoTab,
        ),
      ),
    );
  }
}

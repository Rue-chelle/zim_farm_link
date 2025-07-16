import 'package:flutter/material.dart';
import 'package:zimfarmlink/views/home/home_screen.dart';
import 'package:zimfarmlink/views/marketplace/marketplace_screen.dart';
import 'package:zimfarmlink/views/donations/donations_screen.dart';
import 'package:zimfarmlink/views/assistant/assistant_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    MarketplaceScreen(),
    DonationsScreen(),
    AssistantScreen(),
  ];

  final List<String> _titles = [
    "Home",
    "Marketplace",
    "Donations",
    "Smart Assistant",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.green.shade800,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green.shade700,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Market"),
          BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism), label: "Donations"),
          BottomNavigationBarItem(
              icon: Icon(Icons.agriculture), label: "Assistant"),
        ],
      ),
    );
  }
}

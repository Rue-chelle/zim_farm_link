import 'package:flutter/material.dart';
import '../../views/auth/login_screen.dart';
import '../../views/home/home_screen.dart';
import '../../views/marketplace/marketplace_screen.dart';
import '../../views/assistant/assistant_screen.dart';
import '../../views/community/community_screen.dart';
import '../../views/marketplace/add_listing_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/addListing': (context) => const AddListingScreen(),
  '/marketplace': (context) => const MarketplaceScreen(),
  '/assistant': (context) => const SmartAssistantScreen(),
  '/community': (context) => const CommunityScreen(),
};

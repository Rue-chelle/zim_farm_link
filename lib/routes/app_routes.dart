import 'package:flutter/material.dart';
import '../views/home/home_screen.dart';
import '../views/auth/login_screen.dart';
import '../views/auth/signup_screen.dart'; // placeholder for now

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/signup': (context) => const Placeholder(), // update later
};

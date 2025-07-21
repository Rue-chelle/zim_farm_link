import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'views/auth/login_screen.dart';
import 'views/home/home_screen.dart';
import 'views/marketplace/marketplace_screen.dart';
import 'views/marketplace/add_listing_screen.dart';
import 'views/assistant/assistant_screen.dart';
import 'views/profile/profile_screen.dart';
import 'widgets/custom_navbar.dart';
import 'views/shared/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
<<<<<<< HEAD
    url: 'https://your-project-id.supabase.co', // replace with your project URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhqYXpzZ29hcGNjb2Z0c2xvbXVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI3NTAyMDcsImV4cCI6MjA2ODMyNjIwN30.AY-hwH_p-MN7cLZ29M2EGkSscf9aSAtEszCIRUOqhCQ', 
=======
    url: 'https://your-project-id.supabase.co', // Replace
    anonKey: 'your-anon-key', // Replace
>>>>>>> 3c4653718fb77b8d28db121f96f55742c49f6698
  );

  runApp(const ZimFarmLinkApp());
}

class ZimFarmLinkApp extends StatelessWidget {
  const ZimFarmLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZimFarmLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './views/auth/login_screen.dart';
import './views/navigation/main_navigation_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xjazsgoapccoftslomup.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhqYXpzZ29hcGNjb2Z0c2xvbXVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI3NTAyMDcsImV4cCI6MjA2ODMyNjIwN30.AY-hwH_p-MN7cLZ29M2EGkSscf9aSAtEszCIRUOqhCQ',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = Supabase.instance.client.auth.currentUser != null;

    return MaterialApp(
      title: 'ZimFarmLink',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const MainNavigationWrapper() : const LoginScreen(),
    );
  }
}

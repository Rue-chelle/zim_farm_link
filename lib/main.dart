import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'views/auth/login_screen.dart';
import 'views/auth/signup_screen.dart';
import 'views/auth/get_started_screen.dart';
import  'views/auth/splash_screen.dart';
import '../navigation/main_navigation_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Supabase.initialize(
    url: 'https://xjazsgoapccoftslomup.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhqYXpzZ29hcGNjb2Z0c2xvbXVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI3NTAyMDcsImV4cCI6MjA2ODMyNjIwN30.AY-hwH_p-MN7cLZ29M2EGkSscf9aSAtEszCIRUOqhCQ',
  );
  runApp(const ZimFarmLinkApp());
}

class ZimFarmLinkApp extends StatelessWidget {
  const ZimFarmLinkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZimFarmLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Montserrat',
      ),
      home: const SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../main_app_shell.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return SupabaseAuthWidget(
      // Automatically shows login/signup UI
      child: Builder(
        builder: (context) {
          final session = Supabase.instance.client.auth.currentSession;
          if (session == null) {
            // Auth UI will be shown automatically
            return const SizedBox();
          } else {
            return const MainAppShell(); // This replaces what you had in main.dart
          }
        },
      ),
    );
  }
}

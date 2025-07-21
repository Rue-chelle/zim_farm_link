import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../navigation/farmer_nav.dart';
import '../navigation/buyer_nav.dart';
import '../navigation/ngo_nav.dart';
import '../navigation/admin_nav.dart';
import '../auth/auth.dart';
import '../../services/user_role_service.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = Supabase.instance.client.auth.currentSession;

        if (session == null) {
          return const AuthScreen();
        } else {
          return FutureBuilder<String>(
            future: UserRoleService.getUserRole(session.user.id),
            builder: (context, roleSnapshot) {
              if (!roleSnapshot.hasData) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }

              final role = roleSnapshot.data!;
              switch (role) {
                case 'farmer':
                  return const FarmerNav();
                case 'buyer':
                  return const BuyerNav();
                case 'ngo':
                  return const NGONav();
                case 'admin':
                  return const AdminNav();
                default:
                  return const Scaffold(
                    body: Center(child: Text('Unknown role')),
                  );
              }
            },
          );
        }
      },
    );
  }
}

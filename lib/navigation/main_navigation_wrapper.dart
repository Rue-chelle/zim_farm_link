import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../views/navigation/farmer_nav.dart';
import '../views/navigation/buyer_nav.dart';
import '../views/navigation/ngo_nav.dart';
import '../views/navigation/admin_nav.dart';
import '../views/auth/login_screen.dart';

class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({Key? key}) : super(key: key);

  @override
  _MainNavigationWrapperState createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  String? _role;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserRole();
  }

  Future<void> _fetchUserRole() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
      return;
    }

    final response = await Supabase.instance.client
        .from('UserProfiles')
        .select('role')
        .eq('id', user.id)
        .single()
        .execute();

    if (response.error != null) {
      setState(() {
        _role = null;
        _loading = false;
      });
    } else {
      setState(() {
        _role = response.data['role'] as String?;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    switch (_role) {
      case 'farmer':
        return const FarmerNav();
      case 'buyer':
        return const BuyerNav();
      case 'ngo':
        return const NGONav();
      case 'admin':
        return const AdminNav();
      default:
        return const LoginScreen();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup_screen.dart';
import '../../services/user_role_service.dart';
import '../navigation/farmer_nav.dart';
import '../navigation/buyer_nav.dart';
import '../navigation/ngo_nav.dart';
import '../navigation/admin_nav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  final supabase = Supabase.instance.client;

  Future<void> _login() async {
    setState(() => _loading = true);

    try {
      final response = await supabase.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (response.user != null) {
        final role = await UserRoleService.getUserRole(response.user!.id);
        switch (role) {
          case 'farmer':
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const FarmerNav()));
            break;
          case 'buyer':
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const BuyerNav()));
            break;
          case 'ngo':
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const NGONav()));
            break;
          case 'admin':
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AdminNav()));
            break;
          default:
            _showError('Unknown role');
        }
      }
    } catch (e) {
      _showError('Login failed. Please check your credentials.');
    }

    setState(() => _loading = false);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _loginWithProvider(Provider provider) async {
    await supabase.auth.signInWithOAuth(provider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/logo.png', height: 100),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome to ZimFarmLink',
                      style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Log in to connect, farm, and grow.',
                      style: GoogleFonts.poppins(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loading ? null : _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text('Login', style: GoogleFonts.poppins(fontSize: 16)),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen()));
                },
                child: Text("Don't have an account? Sign up", style: GoogleFonts.poppins()),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text('or', style: GoogleFonts.poppins()),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => _loginWithProvider(Provider.google),
                icon: Image.asset('assets/icons/google.png', height: 20),
                label: Text('Continue with Google', style: GoogleFonts.poppins()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () => _loginWithProvider(Provider.facebook),
                icon: Image.asset('assets/icons/facebook.png', height: 20),
                label: Text('Continue with Facebook', style: GoogleFonts.poppins()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

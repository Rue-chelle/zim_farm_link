import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../navigation/main_navigation_wrapper.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _loading = false;

  Future<void> _signIn() async {
    setState(() => _loading = true);

    try {
      final AuthResponse res = await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (res.user != null) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainNavigationWrapper()),
        );
      } else {
        _showMessage("Invalid email or password.");
      }
    } on AuthException catch (error) {
      _showMessage(error.message);
    } catch (e) {
      _showMessage("An unexpected error occurred.");
    } finally {
      setState(() => _loading = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 100),
                const SizedBox(height: 24),
                const Text(
                  'Welcome Back to ZimFarmLink',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Email',
                  controller: emailController,
                  icon: Icons.email,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  icon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                _loading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: 'Login',
                        onTap: _signIn,
                      ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupScreen()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

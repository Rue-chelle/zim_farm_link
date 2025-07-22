import 'package:flutter/material.dart';
import 'get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const GetStartedScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie.asset('assets/animations/farm_loading.json', height: 200),
          const SizedBox(height: 20),
          const Text('ZimFarmLink',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const Spacer(),
          const Text('Powered by Alora Innovations',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

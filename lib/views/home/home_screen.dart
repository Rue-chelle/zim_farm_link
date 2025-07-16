import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ZimFarmLink"),
        backgroundColor: Colors.green.shade800,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            _FeatureCard(
              title: "Marketplace",
              icon: Icons.storefront,
              color: Colors.orange.shade400,
              onTap: () => Navigator.pushNamed(context, '/marketplace'),
            ),
            _FeatureCard(
              title: "Add Listing",
              icon: Icons.add_circle,
              color: Colors.blue.shade400,
              onTap: () => Navigator.pushNamed(context, '/add-listing'),
            ),
            _FeatureCard(
              title: "Donations",
              icon: Icons.volunteer_activism,
              color: Colors.purple.shade400,
              onTap: () => Navigator.pushNamed(context, '/donations'),
            ),
            _FeatureCard(
              title: "Smart Assistant",
              icon: Icons.agriculture,
              color: Colors.teal.shade400,
              onTap: () => Navigator.pushNamed(context, '/assistant'),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: color.withOpacity(0.3),
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.4)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


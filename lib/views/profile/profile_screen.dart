import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: const AssetImage('assets/images/profile.png'),
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.person, size: 50, color: Colors.grey[400]),
            ),
            const SizedBox(height: 16),

            // Name
            Text(
              'Michelle Samuriwo',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            Text(
              'Smart Farmer',
              style: GoogleFonts.poppins(color: Colors.grey[600]),
            ),

            const SizedBox(height: 24),

            // Info List
            _buildProfileTile(Icons.location_on, 'Region', 'Mashonaland East'),
            _buildProfileTile(Icons.phone, 'Contact', '+263 77 123 4567'),
            _buildProfileTile(Icons.email, 'Email', 'michelle@example.com'),

            const SizedBox(height: 24),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // Navigate to Edit Profile screen (to be added later)
                },
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                onPressed: () {
                  // Handle logout logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(IconData icon, String label, String value) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Icon(icon, color: Colors.green.shade700),
      title:
          Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
      subtitle: Text(value, style: GoogleFonts.poppins()),
    );
  }
}

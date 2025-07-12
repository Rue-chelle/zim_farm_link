import 'package:flutter/material.dart';
import 'package:zimfarmlink/db/local_db.dart';
import 'package:zimfarmlink/views/profile/edit_profile_modal.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late LocalDatabase db;
  UserProfile? _userProfile;

  @override
  void initState() {
    super.initState();
    db = LocalDatabase();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final users = await db.getUserProfiles();
    if (users.isNotEmpty) {
      setState(() {
        _userProfile = users.first;
      });
    }
  }

  void _editProfile() {
    if (_userProfile != null) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => EditProfileModal(userProfile: _userProfile!),
      ).then((_) => _loadUserProfile()); // Refresh after editing
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_userProfile == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: _userProfile!.profileImage != null &&
                      _userProfile!.profileImage!.isNotEmpty
                  ? Image.file(File(_userProfile!.profileImage!)).image
                  : const AssetImage("assets/placeholder.jpg"),
            ),
            const SizedBox(height: 16),
            Text(
              _userProfile!.fullName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              _userProfile!.farmingType,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(_userProfile!.email ?? "No email"),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(_userProfile!.phoneNumber ?? "No phone number"),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(_userProfile!.location ?? "No location"),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
              onPressed: _editProfile,
            ),
          ],
        ),
      ),
    );
  }
}

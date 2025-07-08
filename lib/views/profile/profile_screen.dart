import 'dart:io';
import 'package:flutter/material.dart';
import '../../db/local_db.dart';
import 'edit_profile_modal.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final LocalDatabase db = LocalDatabase();
  UserProfile? _profile;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profiles = await db.getUserProfiles();
    setState(() {
      _profile = profiles.isNotEmpty ? profiles.first : null;
      _loading = false;
    });
  }

  Future<void> _editProfile() async {
    final updated = await showDialog<bool>(
      context: context,
      builder: (_) => EditProfileModal(db: db, existingProfile: _profile),
    );
    if (updated == true) {
      _loadProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_profile == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: Center(
          child: ElevatedButton(
            onPressed: _editProfile,
            child: const Text('Create Profile'),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _editProfile,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: _profile!.profileImage != null
                  ? FileImage(File(_profile!.profileImage!))
                  : null,
              child: _profile!.profileImage == null
                  ? const Icon(Icons.person, size: 60)
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              _profile!.fullName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Phone: ${_profile!.phoneNumber}'),
            Text('Email: ${_profile!.email ?? "Not set"}'),
            Text('Location: ${_profile!.location}'),
            Text('Farming Type: ${_profile!.farmingType}'),
          ],
        ),
      ),
    );
  }
}

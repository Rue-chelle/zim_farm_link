import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zimfarmlink/db/local_db.dart';

class EditProfileModal extends StatefulWidget {
  final UserProfile userProfile;

  const EditProfileModal({super.key, required this.userProfile});

  @override
  State<EditProfileModal> createState() => _EditProfileModalState();
}

class _EditProfileModalState extends State<EditProfileModal> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _fullNameController;
  late TextEditingController _farmingTypeController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _locationController;
  String? _profileImagePath;

  final LocalDatabase db = LocalDatabase();

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.userProfile.fullName);
    _farmingTypeController = TextEditingController(text: widget.userProfile.farmingType);
    _emailController = TextEditingController(text: widget.userProfile.email ?? '');
    _phoneController = TextEditingController(text: widget.userProfile.phoneNumber ?? '');
    _locationController = TextEditingController(text: widget.userProfile.location ?? '');
    _profileImagePath = widget.userProfile.profileImage;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _farmingTypeController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _profileImagePath = picked.path;
      });
    }
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final updatedProfile = UserProfile(
      id: widget.userProfile.id,
      role: widget.userProfile.role,
      fullName: _fullNameController.text,
      farmingType: _farmingTypeController.text,
      email: _emailController.text,
      phoneNumber: _phoneController.text,
      location: _locationController.text,
      profileImage: _profileImagePath ?? '',
    );

    await db.updateUserProfile(updatedProfile);

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Edit Profile', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 45,
                backgroundImage:
                    (_profileImagePath != null && _profileImagePath!.isNotEmpty)
                        ? FileImage(File(_profileImagePath!))
                        : null,
                child: (_profileImagePath == null || _profileImagePath!.isEmpty)
                    ? const Icon(Icons.camera_alt, size: 45)
                    : null,
              ),
            ),
            const SizedBox(height: 12),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(labelText: 'Full Name'),
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Please enter your full name' : null,
                  ),
                  TextFormField(
                    controller: _farmingTypeController,
                    decoration: const InputDecoration(labelText: 'Farming Type'),
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Please enter your farming type' : null,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || val.isEmpty) return null;
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(val)) return 'Enter a valid email';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                  ),
                  TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(labelText: 'Location'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveProfile,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700),
                    child: const Text('Save Changes'),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

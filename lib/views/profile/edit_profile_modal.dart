import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:drift/drift.dart' show Value;
import '../../db/local_db.dart';

class EditProfileModal extends StatefulWidget {
  final LocalDatabase db;
  final UserProfile? existingProfile;

  const EditProfileModal({super.key, required this.db, this.existingProfile});

  @override
  State<EditProfileModal> createState() => _EditProfileModalState();
}

class _EditProfileModalState extends State<EditProfileModal> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _locationController;
  String? _farmingType;
  File? _profileImage;

  final List<String> farmingTypes = ['Crops', 'Livestock', 'Both'];

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.existingProfile?.fullName ?? '');
    _phoneController =
        TextEditingController(text: widget.existingProfile?.phoneNumber ?? '');
    _emailController =
        TextEditingController(text: widget.existingProfile?.email ?? '');
    _locationController =
        TextEditingController(text: widget.existingProfile?.location ?? '');
    _farmingType = widget.existingProfile?.farmingType;
    if (widget.existingProfile?.profileImage != null) {
      _profileImage = File(widget.existingProfile!.profileImage!);
    }
  }

  Future<void> _pickProfileImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _profileImage = File(picked.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      final companion = UserProfilesCompanion(
        fullName: Value(_nameController.text),
        phoneNumber: Value(_phoneController.text),
        email:
            Value(_emailController.text.isEmpty ? null : _emailController.text),
        location: Value(_locationController.text),
        farmingType: Value(_farmingType!),
        profileImage: Value(_profileImage?.path),
      );

      if (widget.existingProfile == null) {
        await widget.db.insertUserProfile(companion);
      } else {
        final updatedProfile = UserProfile(
          id: widget.existingProfile!.id,
          fullName: _nameController.text,
          phoneNumber: _phoneController.text,
          email: _emailController.text.isEmpty ? null : _emailController.text,
          location: _locationController.text,
          farmingType: _farmingType!,
          profileImage: _profileImage?.path,
        );
        await widget.db.updateUserProfile(updatedProfile);
      }

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Profile'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _pickProfileImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? const Icon(Icons.person, size: 50)
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration:
                    const InputDecoration(labelText: 'Email (Optional)'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _farmingType,
                decoration: const InputDecoration(labelText: 'Farming Type'),
                items: farmingTypes
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => _farmingType = val),
                validator: (val) => val == null ? 'Required' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        ElevatedButton(onPressed: _saveProfile, child: const Text('Save')),
      ],
    );
  }
}

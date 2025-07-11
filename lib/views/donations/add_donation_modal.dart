import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zimfarmlink/db/local_db.dart';

class AddDonationModal extends StatefulWidget {
  const AddDonationModal({super.key});

  @override
  State<AddDonationModal> createState() => _AddDonationModalState();
}

class _AddDonationModalState extends State<AddDonationModal> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _donorNameController = TextEditingController();

  String? _imagePath;

  final LocalDatabase db = LocalDatabase();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _imagePath = picked.path);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final newDonation = DonationsCompanion(
      title: Value(_titleController.text),
      description: Value(_descriptionController.text),
      category: Value(_categoryController.text),
      location: Value(_locationController.text),
      contact: Value(_contactController.text),
      donorName: Value(
          _donorNameController.text.isEmpty ? null : _donorNameController.text),
      imagePath: Value(_imagePath ?? ''),
    );

    await db.insertDonation(newDonation);
    Navigator.of(context).pop(true);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _locationController.dispose();
    _contactController.dispose();
    _donorNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add Donation', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: (_imagePath != null && _imagePath!.isNotEmpty)
                    ? FileImage(File(_imagePath!))
                    : null,
                child: (_imagePath == null || _imagePath!.isEmpty)
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
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Enter title' : null,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    maxLines: 2,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Enter description' : null,
                  ),
                  TextFormField(
                    controller: _categoryController,
                    decoration: const InputDecoration(labelText: 'Category'),
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Enter category' : null,
                  ),
                  TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(labelText: 'Location'),
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Enter location' : null,
                  ),
                  TextFormField(
                    controller: _contactController,
                    decoration:
                        const InputDecoration(labelText: 'Contact Info'),
                    validator: (val) => val == null || val.isEmpty
                        ? 'Enter contact info'
                        : null,
                  ),
                  TextFormField(
                    controller: _donorNameController,
                    decoration: const InputDecoration(
                        labelText: 'Donor Name (Optional)'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700),
                    child: const Text('Add Donation'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

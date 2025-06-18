import 'dart:io';

import 'package:flutter/material.dart';
import '../../db/database_helper.dart';
import '../../models/listing_model.dart';
import '../../widgets/primary_button.dart';

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({super.key});

  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dbHelper = DatabaseHelper();

  String title = '';
  String description = '';
  double price = 0;
  String location = '';
  String category = 'Fruits';
  String imagePath = '';

  final List<String> categories = [
    'Fruits',
    'Vegetables',
    'Livestock',
    'Tools'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Listing')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                onSaved: (val) => title = val ?? '',
                validator: (val) =>
                    val == null || val.isEmpty ? 'Please enter a title' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                onSaved: (val) => description = val ?? '',
                validator: (val) => val == null || val.isEmpty
                    ? 'Please enter description'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onSaved: (val) => price = double.tryParse(val ?? '0') ?? 0,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Please enter price';
                  if (double.tryParse(val) == null)
                    return 'Enter a valid number';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location'),
                onSaved: (val) => location = val ?? '',
                validator: (val) =>
                    val == null || val.isEmpty ? 'Please enter location' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Category'),
                value: category,
                items: categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    category = val ?? 'Fruits';
                  });
                },
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: 'Save Listing',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // TODO: Add image picking functionality here

                    final newListing = Listing(
                      id: 0,
                      title: title,
                      description: description,
                      price: price,
                      location: location,
                      category: category,
                      imagePath: imagePath,
                    );

                    await _dbHelper.insertListing(newListing);
                    if (mounted) Navigator.pop(context, true);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

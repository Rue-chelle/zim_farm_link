import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../../../models/listing_model.dart';
import '../../../db/database_helper.dart';

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({Key? key}) : super(key: key);

  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  final _formKey = GlobalKey<FormState>();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  String title = '';
  String description = '';
  String location = '';
  String category = '';
  String contact = '';
  double price = 0;
  File? imageFile;

  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Save image to local storage for DB use
      final dir = await getApplicationDocumentsDirectory();
      final filename = path.basename(pickedFile.path);
      final savedImage =
          await File(pickedFile.path).copy('${dir.path}/$filename');

      setState(() {
        imageFile = savedImage;
      });
    }
  }

  void saveListing() async {
    if (_formKey.currentState!.validate() && imageFile != null) {
      _formKey.currentState!.save();

      final newListing = Listing(
        title: title,
        description: description,
        imagePath: imageFile!.path,
        price: price,
        location: location,
        category: category,
        contact: contact,
      );

      await _dbHelper.insertListing(newListing);

      // Navigate back or show success
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Listing added!')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please complete all fields and select an image.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Listing")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: pickImage,
                child: imageFile == null
                    ? Container(
                        height: 150,
                        color: Colors.grey[300],
                        child: const Center(child: Text('Tap to pick image')),
                      )
                    : Image.file(imageFile!, height: 150, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                onSaved: (value) => title = value ?? '',
                validator: (value) => value!.isEmpty ? 'Enter a title' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) => description = value ?? '',
                validator: (value) =>
                    value!.isEmpty ? 'Enter a description' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onSaved: (value) => price = double.tryParse(value ?? '') ?? 0,
                validator: (value) => value!.isEmpty ? 'Enter a price' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location'),
                onSaved: (value) => location = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Category'),
                onSaved: (value) => category = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Contact Info'),
                onSaved: (value) => contact = value ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveListing,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

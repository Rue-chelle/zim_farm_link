// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../../db/local_db.dart';

class EditListingScreen extends StatefulWidget {
  final Listing listing;

  const EditListingScreen({super.key, required this.listing});

  @override
  // ignore: library_private_types_in_public_api
  _EditListingScreenState createState() => _EditListingScreenState();
}

class _EditListingScreenState extends State<EditListingScreen> {
  final _formKey = GlobalKey<FormState>();
  final LocalDatabase _dbHelper = LocalDatabase();

  late String title;
  late String description;
  late String location;
  late String category;
  late String contact;
  late double price;
  late bool _delivery; // ✅ Added
  File? imageFile;

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final l = widget.listing;
    title = l.title;
    description = l.description;
    location = l.location;
    category = l.category;
    contact = l.contact;
    price = l.price;
    _delivery = l.delivery; // ✅ Initialize delivery
    imageFile = File(l.imagePath);
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
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

      final updatedListing = Listing(
        id: widget.listing.id,
        title: title,
        description: description,
        imagePath: imageFile!.path,
        price: price,
        location: location,
        category: category,
        contact: contact,
        deliveryStatus: widget.listing.deliveryStatus,
        delivery: _delivery, // ✅ Save delivery toggle
      );

      await _dbHelper.updateListing(updatedListing);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Listing updated!')));
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please complete all fields and select an image.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Listing")),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                initialValue: title,
                decoration: const InputDecoration(labelText: 'Title'),
                onSaved: (value) => title = value ?? '',
                validator: (value) => value!.isEmpty ? 'Enter a title' : null,
              ),
              TextFormField(
                initialValue: description,
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) => description = value ?? '',
                validator: (value) =>
                    value!.isEmpty ? 'Enter a description' : null,
              ),
              TextFormField(
                initialValue: price.toString(),
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onSaved: (value) => price = double.tryParse(value ?? '') ?? 0,
                validator: (value) => value!.isEmpty ? 'Enter a price' : null,
              ),
              TextFormField(
                initialValue: location,
                decoration: const InputDecoration(labelText: 'Location'),
                onSaved: (value) => location = value ?? '',
              ),
              TextFormField(
                initialValue: category,
                decoration: const InputDecoration(labelText: 'Category'),
                onSaved: (value) => category = value ?? '',
              ),
              TextFormField(
                initialValue: contact,
                decoration: const InputDecoration(labelText: 'Contact Info'),
                onSaved: (value) => contact = value ?? '',
              ),
              const SizedBox(height: 16),

              // ✅ Delivery switch
              SwitchListTile(
                title: const Text('Delivery Available'),
                value: _delivery,
                onChanged: (val) {
                  setState(() {
                    _delivery = val;
                  });
                },
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveListing,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:image_picker/image_picker.dart'; // ❌ Disabled for web temporarily
// import 'package:google_fonts/google_fonts.dart';
import '../../db/local_db.dart';
import 'package:drift/drift.dart' hide Column;

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({super.key});

  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  final _formKey = GlobalKey<FormState>();
  final db = LocalDatabase();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  String? _category;
  String? _region;
  bool _delivery = false;
  File? _image;

  final List<String> categories = ['Crops', 'Livestock', 'Seeds', 'Tools'];
  final List<String> regions = [
    'Harare',
    'Bulawayo',
    'Manicaland',
    'Masvingo',
    'Midlands',
    'Mashonaland East',
    'Mashonaland West',
    'Matabeleland North',
    'Matabeleland South'
  ];

  // TEMPORARILY DISABLED FOR WEB
  /*
  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      if (!mounted) return;
      setState(() {
        _image = File(picked.path);
      });
    }
  }
  */

  void _pickImage() async {
    if (kIsWeb) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image picking not supported on web.')),
      );
      return;
    }

    // Native image picker - re-enable when testing on device
    /*
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      if (!mounted) return;
      setState(() {
        _image = File(picked.path);
      });
    }
    */
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      if (_image == null && !kIsWeb) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select an image.')),
        );
        return;
      }

      final entry = ListingsCompanion(
        title: Value(_titleController.text),
        description: Value(_descriptionController.text),
        category: Value(_category ?? ''),
        price: Value(double.tryParse(_priceController.text) ?? 0),
        location: Value(_region ?? ''),
        delivery: Value(_delivery),
        imagePath: Value(_image?.path ?? 'no_image'), // Placeholder for web
        contact: Value(_contactController.text),
      );

      await db.insertListing(entry);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Listing saved successfully!')),
      );

      _formKey.currentState!.reset();
      setState(() {
        _image = null;
        _delivery = false;
        _category = null;
        _region = null;
      });

      _titleController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _contactController.clear();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Listing'),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: _image == null
                    ? Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Center(
                          child: Icon(Icons.add_a_photo, size: 40),
                        ),
                      )
                    : kIsWeb
                        ? Container(
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[200],
                            ),
                            child: const Center(
                              child: Text('Image preview not available on web'),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _image!,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price (USD)',
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _category,
                hint: const Text('Select Category'),
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: categories.map((cat) {
                  return DropdownMenuItem(value: cat, child: Text(cat));
                }).toList(),
                onChanged: (val) => setState(() => _category = val),
                validator: (val) => val == null ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _region,
                hint: const Text('Select Region'),
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: regions.map((r) {
                  return DropdownMenuItem(value: r, child: Text(r));
                }).toList(),
                onChanged: (val) => setState(() => _region = val),
                validator: (val) => val == null ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contactController,
                decoration: const InputDecoration(
                  labelText: 'Contact Info (e.g. WhatsApp number)',
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                value: _delivery,
                onChanged: (val) => setState(() => _delivery = val),
                title: const Text('Delivery Available?'),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                onPressed: _submit,
                label: const Text('Submit Listing'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

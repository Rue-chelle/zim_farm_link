
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({super.key});

  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  final _formKey = GlobalKey<FormState>();
  String type = 'Crop'; // or Livestock
  String title = '';
  String category = '';
  double price = 0.0;
  String description = '';
  String imageUrl = '';

  final supabase = Supabase.instance.client;

  Future<void> _submitListing() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await supabase.from('listings').insert({
        'type': type,
        'title': title,
        'category': category,
        'price': price,
        'description': description,
        'image_url': imageUrl,
        'created_at': DateTime.now().toIso8601String(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Listing added successfully!')),
      );

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Listing'),
        backgroundColor: Colors.green.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: type,
                decoration: const InputDecoration(labelText: 'Type'),
                items: const [
                  DropdownMenuItem(value: 'Crop', child: Text('Crop')),
                  DropdownMenuItem(value: 'Livestock', child: Text('Livestock')),
                ],
                onChanged: (value) => setState(() => type = value!),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                onSaved: (val) => title = val ?? '',
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Category'),
                onSaved: (val) => category = val ?? '',
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price (USD)'),
                keyboardType: TextInputType.number,
                onSaved: (val) => price = double.tryParse(val!) ?? 0.0,
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (val) => description = val ?? '',
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Image URL (optional)'),
                onSaved: (val) => imageUrl = val ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _submitListing,
                icon: const Icon(Icons.cloud_upload),
                label: const Text('Submit Listing'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

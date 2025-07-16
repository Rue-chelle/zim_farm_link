import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditListingScreen extends StatefulWidget {
  final Map<String, dynamic> listing;

  const EditListingScreen({super.key, required this.listing});

  @override
  State<EditListingScreen> createState() => _EditListingScreenState();
}

class _EditListingScreenState extends State<EditListingScreen> {
  final _formKey = GlobalKey<FormState>();

  late String type;
  late String title;
  late String category;
  late double price;
  late String description;
  late String imageUrl;

  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    final l = widget.listing;
    type = l['type'];
    title = l['title'];
    category = l['category'];
    price = l['price']?.toDouble() ?? 0.0;
    description = l['description'] ?? '';
    imageUrl = l['image_url'] ?? '';
  }

  Future<void> _updateListing() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await supabase.from('listings').update({
        'type': type,
        'title': title,
        'category': category,
        'price': price,
        'description': description,
        'image_url': imageUrl,
      }).eq('id', widget.listing['id']);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Listing updated!')),
      );

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Listing'),
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
                initialValue: title,
                decoration: const InputDecoration(labelText: 'Title'),
                onSaved: (val) => title = val ?? '',
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: category,
                decoration: const InputDecoration(labelText: 'Category'),
                onSaved: (val) => category = val ?? '',
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: price.toString(),
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onSaved: (val) => price = double.tryParse(val!) ?? 0.0,
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: description,
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (val) => description = val ?? '',
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: imageUrl,
                decoration: const InputDecoration(labelText: 'Image URL'),
                onSaved: (val) => imageUrl = val ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _updateListing,
                icon: const Icon(Icons.save),
                label: const Text('Save Changes'),
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


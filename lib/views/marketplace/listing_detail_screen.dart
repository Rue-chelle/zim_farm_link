// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'edit_listing _screen.dart';
import '../../db/local_db.dart';

class ListingDetailScreen extends StatelessWidget {
  final Listing listing;
  final VoidCallback onDelete;
  final LocalDatabase _dbHelper = LocalDatabase();

  ListingDetailScreen(
      {super.key, required this.listing, required this.onDelete});

  void _deleteListing(BuildContext context) async {
    await _dbHelper.deleteListing(listing.id);
    onDelete();

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listing.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final updated = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditListingScreen(listing: listing),
                ),
              );
              if (updated == true) {
                Navigator.pop(context, true);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Delete Listing?'),
                  content: const Text(
                      'Are you sure you want to delete this listing?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        _deleteListing(context);
                        Navigator.pop(context);
                      },
                      child: const Text('Delete',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(
              File(listing.imagePath),
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              listing.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Price: \$${listing.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Location: ${listing.location}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Category: ${listing.category}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Contact: ${listing.contact}',
              style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              listing.description,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

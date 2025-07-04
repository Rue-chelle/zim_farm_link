import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:zimfarmlink/db/local_db.dart';
// import 'package:zimfarmlink/db/listing_model.dart';
import 'package:zimfarmlink/views/marketplace/listing_detail_screen.dart';
import 'package:zimfarmlink/views/marketplace/edit_listing _screen.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  final db = LocalDatabase();
  List<Listing> _listings = [];

  @override
  void initState() {
    super.initState();
    _loadListings();
  }

  Future<void> _loadListings() async {
    final data = await db.getAllListings();
    setState(() => _listings = data);
  }

  void _deleteListing(int id) async {
    await db.deleteListing(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Listing deleted.')),
    );
    _loadListings();
  }

  void _refreshAfterDelete() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Listing deleted.')),
    );
    _loadListings();
  }

  void _editListing(Listing listing) async {
    final updated = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditListingScreen(listing: listing),
      ),
    );
    if (updated == true) _loadListings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        backgroundColor: Colors.green.shade700,
      ),
      body: _listings.isEmpty
          ? const Center(child: Text('No listings yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _listings.length,
              itemBuilder: (context, index) {
                final listing = _listings[index];
                return GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ListingDetailScreen(
                          listing: listing,
                          onDelete: _refreshAfterDelete,
                        ),
                      ),
                    );
                    if (result == true) _loadListings();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: kIsWeb
                              ? Container(
                                  color: Colors.grey[300],
                                  height: 80,
                                  width: 80,
                                  child: const Center(
                                    child: Text('No image'),
                                  ),
                                )
                              : Image.file(
                                  File(listing.imagePath),
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listing.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                listing.category,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${listing.price.toStringAsFixed(2)}',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () => _editListing(listing),
                                    child: const Text('Edit'),
                                  ),
                                  TextButton(
                                    onPressed: () => _deleteListing(listing.id),
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

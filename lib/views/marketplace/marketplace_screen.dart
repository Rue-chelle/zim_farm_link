import 'dart:io';

import 'package:flutter/material.dart';
import '../../models/listing_model.dart';
import '../../db/database_helper.dart';
import 'listing_detail_screen.dart';
import '../../widgets/rounded_card.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen>
    with SingleTickerProviderStateMixin {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List<Listing> _allListings = [];
  List<Listing> _filteredListings = [];

  String _searchQuery = '';
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Fruits',
    'Vegetables',
    'Livestock',
    'Tools'
  ];

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _loadListings();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animationController.forward();
  }

  void _loadListings() async {
    final listings = await _dbHelper.getAllListings();
    setState(() {
      _allListings = listings;
      _applyFilters();
    });
  }

  void _applyFilters() {
    List<Listing> results = _allListings;

    if (_selectedCategory != 'All') {
      results = results
          .where((listing) => listing.category == _selectedCategory)
          .toList();
    }
    if (_searchQuery.isNotEmpty) {
      results = results
          .where((listing) =>
              listing.title
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()) ||
              listing.description
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))
          .toList();
    }

    setState(() {
      _filteredListings = results;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildListingTile(Listing listing) {
    return RoundedCard(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: listing.imagePath.isNotEmpty
              ? Image.file(
                  File(listing.imagePath),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/images/placeholder.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
        ),
        title: Text(
          listing.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle:
            Text('\$${listing.price.toStringAsFixed(2)} - ${listing.location}'),
        onTap: () async {
          final refresh = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ListingDetailScreen(listing: listing)),
          );
          if (refresh == true) {
            _loadListings();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search listings...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (value) {
                  _searchQuery = value;
                  _applyFilters();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                value: _selectedCategory,
                items: _categories
                    .map(
                        (cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (value) {
                  _selectedCategory = value!;
                  _applyFilters();
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _filteredListings.isEmpty
                  ? const Center(child: Text('No listings found'))
                  : ListView.builder(
                      itemCount: _filteredListings.length,
                      itemBuilder: (context, index) {
                        return _buildListingTile(_filteredListings[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addListing').then((value) {
            if (value == true) _loadListings();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

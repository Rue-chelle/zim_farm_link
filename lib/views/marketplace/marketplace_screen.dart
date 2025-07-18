import 'package:flutter/material.dart';
import 'package:zim_farm_link/views/marketplace/add_listing_screen.dart';
import 'package:zim_farm_link/views/marketplace/listing_detail_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
<<<<<<< HEAD
import 'package:google_fonts/google_fonts.dart';
import '../../models/listing.dart';
import 'listing_detail_screen.dart';
=======
>>>>>>> c21c36e8d4d29806f825c911280ef9689c30498a

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
<<<<<<< HEAD
  final SupabaseClient supabase = Supabase.instance.client;
  List<Listing> listings = [];
  bool isLoading = true;
=======
  final supabase = Supabase.instance.client;
  List<dynamic> _listings = [];
  List<dynamic> _filteredListings = [];
  String _searchQuery = '';
>>>>>>> c21c36e8d4d29806f825c911280ef9689c30498a

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    fetchListings();
  }

  Future<void> fetchListings() async {
    setState(() => isLoading = true);
    final response = await supabase
        .from('listings')
        .select()
        .order('created_at', ascending: false);

    listings = response.map((json) => Listing.fromJson(json)).toList();
    setState(() => isLoading = false);
=======
    _fetchListings();
  }

  Future<void> _fetchListings() async {
    final response = await supabase.from('listings').select('*');
    setState(() {
      _listings = response;
      _filteredListings = response;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _filteredListings = _listings
          .where((item) => item['title']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
>>>>>>> c21c36e8d4d29806f825c911280ef9689c30498a
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return RefreshIndicator(
      onRefresh: fetchListings,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Marketplace'),
          centerTitle: true,
          backgroundColor: Colors.green[700],
          foregroundColor: Colors.white,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : listings.isEmpty
                ? const Center(child: Text("No listings available."))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: listings.length,
                    itemBuilder: (context, index) {
                      final item = listings[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ListingDetailScreen(listing: item.toMap(), onDelete:(){
                                    setState(() {
                                    });
                                  }),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: item.imageUrl != null
                                        ? DecorationImage(
                                            image: NetworkImage(item.imageUrl!),
                                            fit: BoxFit.cover,
                                          )
                                        : const DecorationImage(
                                            image: AssetImage(
                                                'assets/placeholder.png'),
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            GoogleFonts.poppins(fontSize: 13),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item.category,
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.green[800],
                                            ),
                                          ),
                                          Text(
                                            '${item.price} USD',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/add-listing'),
          backgroundColor: Colors.green[700],
          child: const Icon(Icons.add),
=======
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddListingScreen()),
          );
        },
        backgroundColor: Colors.green,
        icon: const Icon(Icons.add),
        label: const Text('Add Listing'),
      ),
      body: RefreshIndicator(
        onRefresh: _fetchListings,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade100),
              ),
              child: TextField(
                onChanged: _onSearchChanged,
                decoration: const InputDecoration(
                  hintText: 'Search listings...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),
            Expanded(
              child: _filteredListings.isEmpty
                  ? const Center(child: Text('No listings found.'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: _filteredListings.length,
                      itemBuilder: (context, index) {
                        final item = _filteredListings[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ListingDetailScreen(listing: item),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16)),
                                  child: Image.network(
                                    item['image_url'] ?? '',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      width: 100,
                                      height: 100,
                                      color: Colors.grey[200],
                                      child: const Icon(Icons.broken_image),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['title'] ?? '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item['description'] ?? '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          'Price: \$${item['price'].toString()}',
                                          style: const TextStyle(
                                              fontSize: 14, color: Colors.green),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
>>>>>>> c21c36e8d4d29806f825c911280ef9689c30498a
        ),
      ),
    );
  }
}

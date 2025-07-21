import 'package:flutter/material.dart';
import 'listing_detail_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/listing.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

  @override
  _MarketplaceScreenState createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  List<Listing> listings = [];
  List<Listing> filteredListings = [];
  bool isLoading = true;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchListings();
  }

  Future<void> fetchListings() async {
    final response = await Supabase.instance.client
        .from('listings')
        .select()
        .order('created_at', ascending: false);

    setState(() {
      listings = (response as List)
          .map((data) => Listing.fromJson(data as Map<String, dynamic>))
          .toList();
      filteredListings = listings;
      isLoading = false;
    });
  }

  void filterListings(String query) {
    final filtered = listings.where((listing) {
      final title = listing.title.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchQuery = query;
      filteredListings = filtered;
    });
  }

  void deleteListing(String id) async {
    await Supabase.instance.client.from('listings').delete().match({'id': id});
    fetchListings(); // Refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text('Marketplace',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green.shade700,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    onChanged: filterListings,
                    decoration: InputDecoration(
                      hintText: 'Search by title...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: filteredListings.isEmpty
                      ? const Center(child: Text('No listings found.'))
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: filteredListings.length,
                          itemBuilder: (context, index) {
                            final item = filteredListings[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListingDetailScreen(
                                      listing: item,
                                      onDelete: () => deleteListing(item.id),
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                elevation: 3,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          const BorderRadius.horizontal(
                                              left: Radius.circular(15)),
                                      child: Image.network(
                                        item.url ??
                                            'https://via.placeholder.com/100',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(item.title,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16)),
                                            const SizedBox(height: 4),
                                            Text(item.description,
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            const SizedBox(height: 6),
                                            Text('\$${item.price}',
                                                style: const TextStyle(
                                                    color: Colors.green)),
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
            ),
    );
  }
}

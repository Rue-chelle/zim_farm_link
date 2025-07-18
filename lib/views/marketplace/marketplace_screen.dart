import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/listing.dart';
import 'listing_detail_screen.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  List<Listing> listings = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
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
        ),
      ),
    );
  }
}

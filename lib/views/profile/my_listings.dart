import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/listing.dart';
import '../marketplace/listing_detail_screen.dart';

class MyListingsScreen extends StatefulWidget {
  const MyListingsScreen({super.key});

  @override
  State<MyListingsScreen> createState() => _MyListingsScreenState();
}

class _MyListingsScreenState extends State<MyListingsScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  List<Listing> myListings = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserListings();
  }

  Future<void> fetchUserListings() async {
    setState(() => isLoading = true);
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final response = await supabase
        .from('listings')
        .select()
        .eq('user_id', user.id)
        .order('created_at', ascending: false);

    myListings = response.map((json) => Listing.fromJson(json)).toList();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Listings'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : myListings.isEmpty
              ? const Center(
                  child: Text("You haven't posted any listings yet."))
              : ListView.builder(
                  itemCount: myListings.length,
                  itemBuilder: (context, index) {
                    final item = myListings[index];
                    return ListTile(
                      leading: item.imageUrl != null
                          ? Image.network(item.imageUrl!,
                              width: 50, height: 50, fit: BoxFit.cover)
                          : Image.asset('assets/placeholder.png',
                              width: 50, height: 50),
                      title: Text(item.title),
                      subtitle: Text(item.description),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await supabase
                              .from('listings')
                              .delete()
                              .eq('id', item.id);
                          fetchUserListings(); // Refresh list
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ListingDetailScreen(
                              listing: item.toMap(),
                              onDelete: fetchUserListings,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}

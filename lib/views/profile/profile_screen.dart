import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> _myListings = [];
  String _userEmail = '';
  String? _userId;

  @override
  void initState() {
    super.initState();
    _fetchProfileAndListings();
  }

  Future<void> _fetchProfileAndListings() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    _userId = user.id;
    _userEmail = user.email ?? 'No email';

    final response = await supabase
        .from('listings')
        .select()
        .eq('user_id', _userId!)
        .order('created_at', ascending: false);

    setState(() => _myListings = response);
  }

  Future<void> _deleteListing(String id) async {
    await supabase.from('listings').delete().eq('id', id);
    _fetchProfileAndListings();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Listing deleted")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.green.shade300,
            child: const Icon(Icons.person, size: 40),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              _userEmail,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "My Listings",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade800,
            ),
          ),
          const SizedBox(height: 12),
          if (_myListings.isEmpty)
            const Text("You haven't added any listings yet."),
          ..._myListings.map((l) => Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(l['title']),
                  subtitle: Text("${l['type']} • ${l['category']}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteListing(l['id']),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

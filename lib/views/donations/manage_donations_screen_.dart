import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ManageDonationsScreen extends StatefulWidget {
  final String userId;

  const ManageDonationsScreen({super.key, required this.userId});

  @override
  State<ManageDonationsScreen> createState() => _ManageDonationsScreenState();
}

class _ManageDonationsScreenState extends State<ManageDonationsScreen> {
  List<dynamic> _donations = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserDonations();
  }

  Future<void> _fetchUserDonations() async {
    final response = await Supabase.instance.client
        .from('donations')
        .select()
        .eq('user_id', widget.userId)
        .order('created_at', ascending: false);

    setState(() {
      _donations = response;
      _isLoading = false;
    });
  }

  Future<void> _deleteDonation(String donationId) async {
    await Supabase.instance.client
        .from('donations')
        .delete()
        .eq('id', donationId);

    _fetchUserDonations(); // Refresh the list after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Donations')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _donations.isEmpty
              ? const Center(child: Text('No donations found.'))
              : ListView.builder(
                  itemCount: _donations.length,
                  itemBuilder: (context, index) {
                    final donation = _donations[index];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(donation['title']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(donation['description']),
                            Text('Status: ${donation['status']}'),
                            Text('Type: ${donation['type']}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () =>
                              _deleteDonation(donation['id'].toString()),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

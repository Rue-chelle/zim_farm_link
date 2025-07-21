import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DonationsListScreen extends StatefulWidget {
  const DonationsListScreen({Key? key}) : super(key: key);

  @override
  State<DonationsListScreen> createState() => _DonationsListScreenState();
}

class _DonationsListScreenState extends State<DonationsListScreen> {
  final supabase = Supabase.instance.client;
  List<dynamic> _donations = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchDonations();
  }

  Future<void> fetchDonations() async {
    try {
      final response = await supabase
          .from('donations')
          .select()
          .order('created_at', ascending: false);

      setState(() {
        _donations = response;
        _loading = false;
      });
    } catch (e) {
      print('Error fetching donations: $e');
      setState(() {
        _loading = false;
      });
    }
  }

  Widget donationCard(dynamic donation) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          donation['title'] ?? 'No Title',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text("Type: ${donation['type'] ?? 'Unknown'}"),
            Text("Quantity: ${donation['quantity'] ?? 'N/A'}"),
            Text("Status: ${donation['status'] ?? 'Available'}"),
            if (donation['description'] != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(donation['description']),
              ),
          ],
        ),
        trailing: const Icon(Icons.favorite_border),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Donations'),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _donations.isEmpty
              ? const Center(child: Text("No donations available yet."))
              : RefreshIndicator(
                  onRefresh: fetchDonations,
                  child: ListView.builder(
                    itemCount: _donations.length,
                    itemBuilder: (context, index) {
                      return donationCard(_donations[index]);
                    },
                  ),
                ),
    );
  }
}


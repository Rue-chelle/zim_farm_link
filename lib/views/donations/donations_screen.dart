import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DonationsScreen extends StatefulWidget {
  const DonationsScreen({super.key});

  @override
  State<DonationsScreen> createState() => _DonationsScreenState();
}

class _DonationsScreenState extends State<DonationsScreen> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> _donations = [];

  @override
  void initState() {
    super.initState();
    _loadDonations();
  }

  Future<void> _loadDonations() async {
    final response = await supabase
        .from('donations')
        .select()
        .order('created_at', ascending: false);
    setState(() => _donations = response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Donations'),
        backgroundColor: Colors.green.shade800,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Donation',
            onPressed: () async {
              final added = await Navigator.pushNamed(context, '/add-donation');
              if (added == true) _loadDonations();
            },
          )
        ],
      ),
      body: _donations.isEmpty
          ? const Center(child: Text('No donations available.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _donations.length,
              itemBuilder: (context, index) {
                final d = _donations[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: d['status'] == 'Available'
                        ? Colors.green[50]
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: d['status'] == 'Available'
                          ? Colors.green
                          : Colors.grey,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        d['title'],
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${d['type']} • ${d['category']}",
                        style: GoogleFonts.poppins(fontSize: 13),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Status: ${d['status']}",
                        style: GoogleFonts.poppins(
                          color: d['status'] == 'Available'
                              ? Colors.green.shade800
                              : Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zimfarmlink/db/local_db.dart';
import 'package:zimfarmlink/views/donations/add_donation_modal.dart';

class DonationsScreen extends StatefulWidget {
  const DonationsScreen({super.key});

  @override
  State<DonationsScreen> createState() => _DonationsScreenState();
}

class _DonationsScreenState extends State<DonationsScreen> {
  final LocalDatabase db = LocalDatabase();

  List<Donation> _donations = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadDonations();
  }

  Future<void> _loadDonations() async {
    setState(() => _loading = true);
    final donations = await db.getAllDonations();
    setState(() {
      _donations = donations;
      _loading = false;
    });
  }

  Future<void> _deleteDonation(int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this donation?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete')),
        ],
      ),
    );

    if (confirm == true) {
      await db.deleteDonation(id);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Donation deleted')));
      await _loadDonations();
    }
  }

  void _openAddDonationModal() async {
    final added = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const AddDonationModal(),
    );

    if (added == true) {
      await _loadDonations();
    }
  }

  Widget _buildDonationCard(Donation donation) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: donation.imagePath != null && donation.imagePath!.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.file(
                  File(donation.imagePath!),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.volunteer_activism,
                    size: 30, color: Colors.grey),
              ),
        title: Text(donation.title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${donation.category} • ${donation.location}'),
            if (donation.donorName != null && donation.donorName!.isNotEmpty)
              Text('Donor: ${donation.donorName}',
                  style: const TextStyle(fontSize: 12)),
            Text(
                'Added: ${donation.dateAdded.toLocal().toString().split(' ')[0]}',
                style: const TextStyle(fontSize: 12)),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _deleteDonation(donation.id),
          tooltip: 'Delete Donation',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donations'),
        backgroundColor: Colors.green.shade700,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Donation',
            onPressed: _openAddDonationModal,
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadDonations,
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _donations.isEmpty
                ? const Center(child: Text('No donations found.'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _donations.length,
                    itemBuilder: (_, i) => _buildDonationCard(_donations[i]),
                  ),
      ),
    );
  }
}

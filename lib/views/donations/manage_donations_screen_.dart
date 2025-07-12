import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zimfarmlink/db/local_db.dart';

class ManageDonationsScreen extends StatefulWidget {
  const ManageDonationsScreen({super.key});

  @override
  State<ManageDonationsScreen> createState() => _ManageDonationsScreenState();
}

class _ManageDonationsScreenState extends State<ManageDonationsScreen> {
  late LocalDatabase db;
  List<Donation> donations = [];

  @override
  void initState() {
    super.initState();
    db = LocalDatabase();
    loadDonations();
  }

  Future<void> loadDonations() async {
    final all = await db.getAllDonations();
    setState(() {
      donations = all;
    });
  }

  Future<void> deleteDonation(int id) async {
    await db.deleteDonation(id);
    loadDonations();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Donation deleted")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Donations")),
      body: donations.isEmpty
          ? const Center(child: Text("No donations found."))
          : ListView.builder(
              itemCount: donations.length,
              itemBuilder: (context, index) {
                final donation = donations[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: donation.imagePath != null && donation.imagePath!.isNotEmpty
                          ? FileImage(File(donation.imagePath!))
                          : const AssetImage('assets/placeholder.jpg') as ImageProvider,
                    ),
                    title: Text(donation.title),
                    subtitle: Text(donation.description),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateFormat.yMMMd().format(donation.dateAdded)),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteDonation(donation.id),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

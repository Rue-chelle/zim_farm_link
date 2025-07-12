import 'package:flutter/material.dart';
import 'package:zimfarmlink/db/local_db.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb

import 'dart:io'; // for FileImage

class NGODashboardScreen extends StatefulWidget {
  const NGODashboardScreen({super.key});

  @override
  State<NGODashboardScreen> createState() => _NGODashboardScreenState();
}

class _NGODashboardScreenState extends State<NGODashboardScreen> {
  late LocalDatabase db;
  int totalListings = 0;
  int totalDonations = 0;
  int totalFarmers = 0;
  List<Donation> recentDonations = [];
  List<UserProfile> farmers = [];

  @override
  void initState() {
    super.initState();
    db = LocalDatabase();
    loadData();
  }

  Future<void> loadData() async {
    final listings = await db.getAllListings();
    final donations = await db.getAllDonations();
    final profiles = await db.getUserProfiles();

    setState(() {
      totalListings = listings.length;
      totalDonations = donations.length;
      totalFarmers = profiles.length;
      recentDonations = donations.take(5).toList();
      farmers = profiles.where((p) => p.role == 'user').toList();

    });
  }

  Widget statCard(String label, int count, IconData icon, Color color, VoidCallback onTap) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(count.toString(), style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    ),
  );
}


 Widget donationTile(Donation donation) {
  ImageProvider imageProvider;

  if (donation.imagePath != null &&
      donation.imagePath!.isNotEmpty &&
      !kIsWeb) {
    imageProvider = FileImage(File(donation.imagePath!));
  } else {
    imageProvider = const AssetImage('assets/placeholder.jpg');
  }

  return ListTile(
    leading: CircleAvatar(backgroundImage: imageProvider),
    title: Text(donation.title),
    subtitle: Text("By ${donation.donorName ?? 'Anonymous'}"),
    trailing: Text(DateFormat.yMMMd().format(donation.dateAdded)),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NGO Dashboard")),
      body: RefreshIndicator(
  onRefresh: loadData,
  child: SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    physics: const AlwaysScrollableScrollPhysics(),
    child: Column(
          children: [
            // --- STATS CARDS ---
           Row(
  children: [
    statCard("Listings", totalListings, Icons.store, Colors.green, () {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => const AllListingsScreen(), // to be created
      ));
    }),
    const SizedBox(width: 10),
    statCard("Donations", totalDonations, Icons.volunteer_activism, Colors.orange, () {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => const ManageDonationsScreen(), // to be created
      ));
    }),
    const SizedBox(width: 10),
    statCard("Farmers", totalFarmers, Icons.people, Colors.blue, () {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => const RegisteredFarmersScreen(), // to be created
      ));
    }),
  ],
),

            const SizedBox(height: 24),

            // --- RECENT DONATIONS ---
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Recent Donations", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold))

                  ),
            
            const SizedBox(height: 8),
            ...recentDonations.map(donationTile),

            const SizedBox(height: 24),

            // --- FARMERS LIST (Optional) ---
            Align(
              alignment: Alignment.centerLeft,
              child:Text("Registered Farmers", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold))

                  ),
            const SizedBox(height: 8),
            ...farmers.map((user) => ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(user.fullName),
                  subtitle: Text(user.location ?? "Unknown Location"),
                  trailing: Text(user.farmingType),
                )),
          ],
        ),
      ),
    ));
  }
}

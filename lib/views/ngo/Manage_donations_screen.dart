import 'package:flutter/material.dart';
import 'package:zimfarmlink/db/local_db.dart';

class ManageDonationsScreen extends StatelessWidget {
  const ManageDonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = LocalDatabase();

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Donations')),
      body: FutureBuilder<List<Donation>>(
        future: db.getAllDonations(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final donations = snapshot.data!;
          return ListView.builder(
            itemCount: donations.length,
            itemBuilder: (_, i) {
              final d = donations[i];
              return ListTile(
                leading: const Icon(Icons.volunteer_activism),
                title: Text(d.title),
                subtitle: Text("By ${d.donorName ?? "Anonymous"}"),
              );
            },
          );
        },
      ),
    );
  }
}

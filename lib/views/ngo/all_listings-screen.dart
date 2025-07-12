import 'package:flutter/material.dart';
import 'package:zimfarmlink/db/local_db.dart';

class AllListingsScreen extends StatelessWidget {
  const AllListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = LocalDatabase();

    return Scaffold(
      appBar: AppBar(title: const Text('All Listings')),
      body: FutureBuilder<List<Listing>>(
        future: db.getAllListings(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          final listings = snapshot.data!;
          return ListView.builder(
            itemCount: listings.length,
            itemBuilder: (_, i) {
              final l = listings[i];
              return ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: Text(l.title),
                subtitle: Text(l.location),
                trailing: Text("\$${l.price.toStringAsFixed(2)}"),
              );
            },
          );
        },
      ),
    );
  }
}

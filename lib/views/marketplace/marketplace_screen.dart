import 'package:flutter/material.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final demoListings = [
      {
        'title': 'Maize (50kg)',
        'price': 'USD 15',
        'location': 'Chiredzi',
        'image': 'https://via.placeholder.com/150'
      },
      {
        'title': 'Cattle - Brahman Bull',
        'price': 'USD 400',
        'location': 'Gokwe',
        'image': 'https://via.placeholder.com/150'
      },
      {
        'title': 'Organic Fertilizer (20kg)',
        'price': 'USD 8',
        'location': 'Marondera',
        'image': 'https://via.placeholder.com/150'
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search marketplace...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: demoListings.length,
              itemBuilder: (context, index) {
                final item = demoListings[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item['image']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(item['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${item['location']} • ${item['price']}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // View details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Next: Open "Add New Listing" screen
        },
        label: const Text("Add Listing"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}

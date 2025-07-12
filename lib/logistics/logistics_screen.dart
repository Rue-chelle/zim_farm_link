import 'package:flutter/material.dart';
import 'package:zimfarmlink/db/local_db.dart';

class LogisticsScreen extends StatefulWidget {
  final String userRole;
  const LogisticsScreen({super.key, required this.userRole});

  @override
  State<LogisticsScreen> createState() => _LogisticsScreenState();
}

class _LogisticsScreenState extends State<LogisticsScreen> {
  late LocalDatabase db;
  List<Listing> listings = [];

  @override
  void initState() {
    super.initState();
    db = LocalDatabase();
    loadListings();
  }

  Future<void> loadListings() async {
    final data = await db.getAllListings();
    setState(() => listings = data);
  }

  Future<void> updateStatus(int id, String newStatus) async {
    await db.updateDeliveryStatus(id, newStatus);
    await loadListings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Logistics Tracker")),
      body: ListView.builder(
        itemCount: listings.length,
        itemBuilder: (_, index) {
          final item = listings[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(item.title),
              subtitle: Text("Current Status: ${item.deliveryStatus}"),
              trailing: widget.userRole == 'ngo' || widget.userRole == 'admin'
                  ? DropdownButton<String>(
                      value: item.deliveryStatus,
                      items: ['Pending', 'In Transit', 'Delivered']
                          .map((status) => DropdownMenuItem(
                                value: status,
                                child: Text(status),
                              ))
                          .toList(),
                      onChanged: (newStatus) {
                        if (newStatus != null) {
                          updateStatus(item.id, newStatus);
                        }
                      },
                    )
                  : Text(item.deliveryStatus,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}

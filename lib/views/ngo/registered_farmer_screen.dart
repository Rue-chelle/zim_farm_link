import 'package:flutter/material.dart';
import 'package:zimfarmlink/db/local_db.dart';

class RegisteredFarmersScreen extends StatelessWidget {
  const RegisteredFarmersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = LocalDatabase();

    return Scaffold(
      appBar: AppBar(title: const Text('Registered Farmers')),
      body: FutureBuilder<List<UserProfile>>(
        future: db.getUserProfiles(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final farmers = snapshot.data!.where((f) => f.role == 'user').toList();
          return ListView.builder(
            itemCount: farmers.length,
            itemBuilder: (_, i) {
              final f = farmers[i];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(f.fullName),
                subtitle: Text(f.location ?? 'No Location'),
                trailing: Text(f.farmingType),
              );
            },
          );
        },
      ),
    );
  }
}

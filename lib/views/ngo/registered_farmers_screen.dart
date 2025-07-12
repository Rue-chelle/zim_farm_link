import 'package:flutter/material.dart';
import 'package:zimfarmlink/db/local_db.dart';
import 'dart:io';

class RegisteredFarmersScreen extends StatefulWidget {
  const RegisteredFarmersScreen({super.key});

  @override
  State<RegisteredFarmersScreen> createState() =>
      _RegisteredFarmersScreenState();
}

class _RegisteredFarmersScreenState extends State<RegisteredFarmersScreen> {
  late LocalDatabase db;
  List<UserProfile> farmers = [];

  @override
  void initState() {
    super.initState();
    db = LocalDatabase();
    loadFarmers();
  }

  Future<void> loadFarmers() async {
    final profiles = await db.getUserProfiles();
    setState(() {
      farmers = profiles.where((u) => u.role == 'user').toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registered Farmers")),
      body: farmers.isEmpty
          ? const Center(child: Text("No farmers registered yet."))
          : ListView.builder(
              itemCount: farmers.length,
              itemBuilder: (context, index) {
                final farmer = farmers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: farmer.profileImage != null &&
                            farmer.profileImage!.isNotEmpty
                        ? FileImage(File(farmer.profileImage!))
                        : const AssetImage('assets/placeholder.jpg')
                            as ImageProvider,
                  ),
                  title: Text(farmer.fullName),
                  subtitle: Text(farmer.farmingType),
                  trailing: Text(farmer.location ?? "Unknown"),
                );
              },
            ),
    );
  }
}

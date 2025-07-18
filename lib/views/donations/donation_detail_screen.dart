import 'package:flutter/material.dart';
import 'donation_model.dart';

class DonationDetailScreen extends StatelessWidget {
  final DonationModel donation;

  const DonationDetailScreen({super.key, required this.donation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Details'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  donation.type == 'Livestock' ? Icons.pets : Icons.agriculture,
                  size: 60,
                  color: Colors.green.shade600,
                ),
                const SizedBox(height: 20),
                Text(
                  donation.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  donation.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Chip(
                      label: Text(
                        donation.type,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      backgroundColor: Colors.green.shade50,
                    ),
                    const SizedBox(width: 12),
                    Chip(
                      label: Text(
                        donation.status,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: donation.status == 'Available'
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                      backgroundColor: donation.status == 'Available'
                          ? Colors.green.shade100
                          : Colors.grey.shade300,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

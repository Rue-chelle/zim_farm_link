import 'package:flutter/material.dart';
import 'package:zim_farm_link/models/donation_model.dart';
import 'package:zim_farm_link/views/donations/donation_detail_screen.dart';

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DonationModel> donations = [
      DonationModel(
        id: '1',
        title: 'Maize Seeds',
        description: 'Hybrid maize seeds, drought resistant.',
        type: 'Crop',
        status: 'Available',
      ),
      DonationModel(
        id: '2',
        title: 'Goat for Breeding',
        description: 'Healthy male goat for village breeding program.',
        type: 'Livestock',
        status: 'Claimed',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Donations'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: donations.length,
        itemBuilder: (context, index) {
          final donation = donations[index];
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DonationDetailScreen(donation: donation),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.shade100.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      donation.type == 'Livestock'
                          ? Icons.pets
                          : Icons.agriculture,
                      size: 36,
                      color: Colors.green.shade600,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            donation.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            donation.description,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Chip(
                                label: Text(donation.type),
                                backgroundColor: Colors.green.shade50,
                              ),
                              const SizedBox(width: 8),
                              Chip(
                                label: Text(
                                  donation.status,
                                  style: TextStyle(
                                    color: donation.status == 'Available'
                                        ? Colors.green.shade800
                                        : Colors.grey.shade600,
                                  ),
                                ),
                                backgroundColor: donation.status == 'Available'
                                    ? Colors.green.shade100
                                    : Colors.grey.shade200,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


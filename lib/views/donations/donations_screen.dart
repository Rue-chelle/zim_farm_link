import 'package:flutter/material.dart';

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({super.key});

  final List<Map<String, dynamic>> donations = const [
    {
      'title': 'Maize (50kg)',
      'type': 'Crop',
      'location': 'Mutoko, Mashonaland East',
      'status': 'Available',
      'description': '50kg bag of high-quality maize seeds.',
    },
    {
      'title': 'Goat (Male)',
      'type': 'Livestock',
      'location': 'Gweru, Midlands',
      'status': 'Claimed',
      'description': 'Healthy male goat ready for breeding.',
    },
    {
      'title': 'Tomatoes (Crate)',
      'type': 'Crop',
      'location': 'Chiredzi, Masvingo',
      'status': 'Available',
      'description': 'Fresh tomatoes for redistribution.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donations"),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.green.shade50,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: donations.length,
        itemBuilder: (context, index) {
          final donation = donations[index];
          return DonationCard(donation: donation, onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DonationDetailScreen(donation: donation),
              ),
            );
          });
        },
      ),
    );
  }
}

class DonationCard extends StatelessWidget {
  final Map<String, dynamic> donation;
  final VoidCallback onTap;

  const DonationCard({
    super.key,
    required this.donation,
    required this.onTap,
  });

  Color getStatusColor(String status) {
    return status == 'Available' ? Colors.green : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(
              donation['type'] == 'Crop' ? Icons.local_florist : Icons.pets,
              color: Colors.green.shade700,
              size: 30,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    donation['title'],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(donation['location'],
                      style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: getStatusColor(donation['status']).withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                donation['status'],
                style: TextStyle(
                  color: getStatusColor(donation['status']),
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

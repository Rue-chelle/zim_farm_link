import 'package:flutter/material.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Marketplace coming soon...",
          style: TextStyle(fontSize: 16, color: Colors.grey[600])),
    );
  }
}

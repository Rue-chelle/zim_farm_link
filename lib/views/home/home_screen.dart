import 'package:flutter/material.dart';
import '../marketplace/marketplace_screen.dart';
import '../donations/donations_screen.dart';
import '../profile/profile_screen.dart';
import '../assistant/assistant_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardData = [
      {
        'title': 'Marketplace',
        'subtitle': 'Buy & Sell Crops/Livestock',
        'icon': Icons.shopping_cart_outlined,
        'color': Colors.green[600],
        'route': const MarketplaceScreen(),
      },
      {
        'title': 'Donations',
        'subtitle': 'Give or Claim Produce',
        'icon': Icons.volunteer_activism_outlined,
        'color': Colors.orange[700],
        'route': const DonationsScreen(),
      },
      {
        'title': 'Smart Assistant',
        'subtitle': 'Farming Help & AI Tools',
        'icon': Icons.agriculture_outlined,
        'color': Colors.blue[600],
        'route': const SmartAssistantScreen(),
      },
      {
        'title': 'My Profile',
        'subtitle': 'Account & Listings',
        'icon': Icons.person_outline,
        'color': Colors.teal[700],
        'route': const ProfileScreen(),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'ZimFarmLink',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: cardData.map((card) {
            return _AnimatedHomeCard(
              title: card['title'] as String,
              subtitle: card['subtitle'] as String,
              icon: card['icon'] as IconData,
              color: card['color'] as Color,
              destination: card['route'] as Widget,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _AnimatedHomeCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget destination;

  const _AnimatedHomeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.destination,
  });

  @override
  State<_AnimatedHomeCard> createState() => _AnimatedHomeCardState();
}

class _AnimatedHomeCardState extends State<_AnimatedHomeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _scale = Tween(begin: 1.0, end: 0.97).animate(_controller);
  }

  void _onTapDown(_) => _controller.forward();
  void _onTapUp(_) => _controller.reverse();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: (details) => _onTapUp(details),
      onTapCancel: () => _controller.reverse(),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => widget.destination));
      },
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: const Offset(2, 4),
              )
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(widget.icon, size: 36, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

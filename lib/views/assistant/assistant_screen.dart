import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SmartAssistantScreen extends StatefulWidget {
  const SmartAssistantScreen({super.key});

  @override
  State<SmartAssistantScreen> createState() => _SmartAssistantScreenState();
}

class _SmartAssistantScreenState extends State<SmartAssistantScreen> {
  File? _image;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // TODO: Integrate with AI diagnosis model or API
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Image picked. Diagnosis coming soon...")),
      );
    }
  }

  void getRecommendations() {
    // TODO: Implement actual logic using soil, region, weather, and demand
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Smart Recommendations"),
        content: const Text(
            "✅ Best crops to plant now:\n\n• Maize\n• Groundnuts\n• Sorghum"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text("Farming Assistant"),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            AssistantCard(
              title: "📸 Plant Diagnosis",
              subtitle: "Take a photo to detect plant health issues",
              icon: Icons.camera_alt,
              color: Colors.orange.shade300,
              onTap: pickImage,
            ),
            const SizedBox(height: 16),
            AssistantCard(
              title: "🌱 Smart Planting Guide",
              subtitle: "What to farm based on soil, weather, demand",
              icon: Icons.agriculture,
              color: Colors.green.shade400,
              onTap: getRecommendations,
            ),
            const SizedBox(height: 20),
            if (_image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(_image!, height: 180),
              ),
          ],
        ),
      ),
    );
  }
}

class AssistantCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const AssistantCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

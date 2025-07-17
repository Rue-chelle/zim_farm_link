import 'package:flutter/material.dart';
import 'package:zimfarmlink/views/assistant/image_diagnosis_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SmartAssistantScreen extends StatefulWidget {
  const SmartAssistantScreen({super.key});

  @override
  State<SmartAssistantScreen> createState() => _SmartAssistantScreenState();
}

class _SmartAssistantScreenState extends State<SmartAssistantScreen> {
  final _controller = TextEditingController();
  String _response = '';
  bool _isLoading = false;

  void _getRecommendation() async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
      _response = '';
    });

    // Simulated AI delay (replace with API later)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      _response = '''
✅ Based on your query:

• Try planting **sorghum or groundnuts** — suited for low rainfall areas.
• Rotate with **legumes** to improve nitrogen levels.
• Check soil pH before maize planting.
• Livestock tip: Add natural grass buffer zones during dry season.

📍Tailored insights coming soon (by region & soil).
''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Smart Farming Assistant",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Ask a question about crops, soil or livestock...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ImageDiagnosisScreen()),
                );
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text("Diagnose Plant Image"),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _getRecommendation,
              icon: const Icon(Icons.search),
              label: const Text("Get Recommendation"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_response.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _response,
                  style: GoogleFonts.poppins(fontSize: 15),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

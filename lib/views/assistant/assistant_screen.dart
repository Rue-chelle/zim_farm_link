import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  File? _image;
  final picker = ImagePicker();
  String _diagnosisResult = '';
  String _recommendation = '';
  bool _loading = false;

  Future<void> _pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
        _diagnosisResult = '';
        _recommendation = '';
      });

      _analyzePlant();
    }
  }

  Future<void> _analyzePlant() async {
    setState(() => _loading = true);

    // Simulated diagnosis and recommendation
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _diagnosisResult = 'Possible leaf blight detected.';
      _recommendation =
          'Consider using eco-friendly fungicide and improve air circulation.';
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Assistant"),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Ask your Smart Assistant",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              "Upload a photo of your crop or get planting advice based on your location and farming goals.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: kIsWeb
                            ? Image.network(_image!.path, fit: BoxFit.cover)
                            : Image.file(_image!, fit: BoxFit.cover),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add_a_photo,
                              size: 40, color: Colors.grey),
                          const SizedBox(height: 8),
                          Text("Tap to upload plant image",
                              style: GoogleFonts.poppins(color: Colors.grey)),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 20),
            _loading
                ? const CircularProgressIndicator()
                : _diagnosisResult.isNotEmpty
                    ? Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Diagnosis:",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(_diagnosisResult,
                                style: GoogleFonts.poppins(fontSize: 14)),
                            const SizedBox(height: 10),
                            Text("Recommendation:",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(_recommendation,
                                style: GoogleFonts.poppins(fontSize: 14)),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
            const SizedBox(height: 30),
            Text(
              "Need help deciding what to plant?",
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Later: Show modal with smart planting recommendations
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Planting Recommendation"),
                    content: const Text(
                        "Based on your location (Mashonaland East) and season, we recommend:\n\n- Tomatoes\n- Maize\n- Cowpeas\n\nThese crops match the current demand and suit your climate."),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Close")),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.lightbulb_outline),
              label: const Text("Get Planting Suggestions"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

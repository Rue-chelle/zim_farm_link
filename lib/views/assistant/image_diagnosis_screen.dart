import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ImageDiagnosisScreen extends StatefulWidget {
  const ImageDiagnosisScreen({super.key});

  @override
  State<ImageDiagnosisScreen> createState() => _ImageDiagnosisScreenState();
}

class _ImageDiagnosisScreenState extends State<ImageDiagnosisScreen> {
  File? _imageFile;
  String? _webImageBase64;
  String _diagnosis = '';
  bool _loading = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        if (kIsWeb) {
          _webImageBase64 = picked.path;
        } else {
          _imageFile = File(picked.path);
        }
        _diagnosis = '';
      });
    }
  }

  Future<void> _analyzeImage() async {
    if (_imageFile == null && _webImageBase64 == null) return;

    setState(() {
      _loading = true;
      _diagnosis = '';
    });

    // Simulated delay - replace with model call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _loading = false;
      _diagnosis = '''
🧪 Diagnosis Result:

• Detected signs of **fungal leaf spot**
• Recommend using natural neem-based spray
• Avoid overwatering. Ensure sun exposure
• Monitor weekly for pest changes

📌 For deeper scan, upload via clinic submission soon.
''';
    });
  }

  Widget _buildImagePreview() {
    if (kIsWeb && _webImageBase64 != null) {
      return Image.network(_webImageBase64!, height: 220);
    } else if (_imageFile != null) {
      return Image.file(_imageFile!, height: 220);
    }
    return const Text("No image selected.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Diagnosis"),
        backgroundColor: Colors.green.shade800,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton.icon(
            onPressed: _pickImage,
            icon: const Icon(Icons.photo),
            label: const Text("Pick Plant Image"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
          const SizedBox(height: 20),
          Center(child: _buildImagePreview()),
          const SizedBox(height: 20),
          if (_imageFile != null || _webImageBase64 != null)
            ElevatedButton.icon(
              onPressed: _analyzeImage,
              icon: const Icon(Icons.search),
              label: const Text("Analyze"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          const SizedBox(height: 20),
          if (_loading)
            const Center(child: CircularProgressIndicator())
          else if (_diagnosis.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _diagnosis,
                style: GoogleFonts.poppins(fontSize: 15),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListingDetailScreen extends StatelessWidget {
  final Map<String, dynamic> listing;
  final VoidCallback onDelete;

  const ListingDetailScreen({
    super.key,
    required this.listing,
    required this.onDelete,
  });

  Future<void> _delete(BuildContext context) async {
    final supabase = Supabase.instance.client;

    await supabase
        .from('listings')
        .delete()
        .eq('id', listing['id']);

    onDelete();
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = listing['image_url'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listing Details'),
        backgroundColor: Colors.green.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            if (imageUrl != null && imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            else
              Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text("No image available"),
              ),
            const SizedBox(height: 20),
            _detailRow("Title", listing['title']),
            _detailRow("Type", listing['type']),
            _detailRow("Category", listing['category']),
            _detailRow("Price", "\$${listing['price']}"),
            _detailRow("Description", listing['description'] ?? '-'),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => _delete(context),
              icon: const Icon(Icons.delete_forever),
              label: const Text("Delete Listing"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
          children: [
            TextSpan(
              text: "$title: ",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

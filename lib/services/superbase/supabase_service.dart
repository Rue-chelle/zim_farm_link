import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient client = Supabase.instance.client;

  // ------------------ AUTH ------------------

  Future<AuthResponse> signUp(String email, String password) async {
    return await client.auth.signUp(email: email, password: password);
  }

  Future<AuthResponse> signIn(String email, String password) async {
    return await client.auth
        .signInWithPassword(email: email, password: password);
  }

  User? get currentUser => client.auth.currentUser;

  Future<void> signOut() async {
    await client.auth.signOut();
  }

  // ------------------ USER PROFILE ------------------

  Future<Map<String, dynamic>?> getUserProfile() async {
    final uid = currentUser?.id;
    if (uid == null) return null;

    final response =
        await client.from('UserProfiles').select().eq('id', uid).single();

    return response;
  }

  // ------------------ LISTINGS ------------------

  Future<List<Map<String, dynamic>>> fetchListings() async {
    final data = await client
        .from('listings')
        .select()
        .order('created_at', ascending: false);

    return List<Map<String, dynamic>>.from(data);
  }

  Future<void> addListing({
    required String title,
    required String description,
    required String category,
    required String location,
    String? imageUrl,
  }) async {
    await client.from('listings').insert({
      'user_id': currentUser?.id,
      'title': title,
      'description': description,
      'category': category,
      'location': location,
      'image_url': imageUrl,
    });
  }

  // ------------------ DONATIONS ------------------

  Future<List<Map<String, dynamic>>> fetchDonations() async {
    final data = await client
        .from('donations')
        .select()
        .order('created_at', ascending: false);

    return List<Map<String, dynamic>>.from(data);
  }

  Future<void> addDonation({
    required String title,
    required String description,
    required String category,
    required String status,
    String? imageUrl,
  }) async {
    await client.from('donations').insert({
      'user_id': currentUser?.id,
      'title': title,
      'description': description,
      'category': category,
      'status': status,
      'image_url': imageUrl,
    });
  }

  // ------------------ FILE UPLOAD (OPTIONAL) ------------------

  Future<String?> uploadImage(File file, String bucket) async {
    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';

    final response = await client.storage.from(bucket).upload(
          fileName,
          file,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );

    final url = client.storage.from(bucket).getPublicUrl(fileName);
    return url;
  }
}

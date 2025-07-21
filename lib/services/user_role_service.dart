import 'package:supabase_flutter/supabase_flutter.dart';

class UserRoleService {
  static Future<String> getUserRole(String userId) async {
    final response = await Supabase.instance.client
        .from('UserProfiles')
        .select('role')
        .eq('id', userId)
        .single();

    return response['role'] as String;
  }
}

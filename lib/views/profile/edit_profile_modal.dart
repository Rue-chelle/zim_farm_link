import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final supabase = Supabase.instance.client;

  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _location;
  String? _phone;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final response = await supabase
        .from('user_profiles')
        .select()
        .eq('id', user.id)
        .single();

    if (mounted) {
      setState(() {
        _name = response['name'] ?? '';
        _location = response['location'] ?? '';
        _phone = response['phone'] ?? '';
        _isLoading = false;
      });
    }
  }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final user = supabase.auth.currentUser;
    if (user == null) return;

    await supabase.from('user_profiles').upsert({
      'id': user.id,
      'name': _name,
      'location': _location,
      'phone': _phone,
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _name,
                      decoration: const InputDecoration(labelText: 'Name'),
                      onSaved: (val) => _name = val,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      initialValue: _location,
                      decoration: const InputDecoration(labelText: 'Location'),
                      onSaved: (val) => _location = val,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      initialValue: _phone,
                      decoration:
                          const InputDecoration(labelText: 'Phone Number'),
                      keyboardType: TextInputType.phone,
                      onSaved: (val) => _phone = val,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _updateProfile,
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

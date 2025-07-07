class UserProfile {
  final int? id;
  final String fullName;
  final String email;
  final String phone;
  final String location;
  final String? profileImagePath;

  UserProfile({
    this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.location,
    this.profileImagePath,
  });

  // Convert UserProfile to Map for DB insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'location': location,
      'profileImagePath': profileImagePath,
    };
  }

  // Create UserProfile from DB Map
  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'],
      fullName: map['fullName'],
      email: map['email'],
      phone: map['phone'],
      location: map['location'],
      profileImagePath: map['profileImagePath'],
    );
  }
}

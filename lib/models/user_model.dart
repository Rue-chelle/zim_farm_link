class UserProfile {
  final int id;
  final String name;
  final String contact;

  UserProfile({required this.id, required this.name, required this.contact});

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'contact': contact,
      };

  factory UserProfile.fromMap(Map<String, dynamic> map) => UserProfile(
        id: map['id'],
        name: map['name'],
        contact: map['contact'],
      );
}

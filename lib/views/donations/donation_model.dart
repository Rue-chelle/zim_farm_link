class DonationModel {
  final String id;
  final String title;
  final String description;
  final String type; // Crop or Livestock
  final String status; // Available or Claimed

  DonationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
  });

  factory DonationModel.fromMap(Map<String, dynamic> map) {
    return DonationModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      type: map['type'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'status': status,
    };
  }
}


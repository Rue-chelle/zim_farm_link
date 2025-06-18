class Listing {
  final int? id;
  final String title;
  final String description;
  final String imagePath;
  final double price;
  final String location;
  final String category;
  final String contact;

  Listing({
    this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.location,
    required this.category,
    required this.contact,
  });

  // Convert Listing to Map for DB
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imagePath': imagePath,
      'price': price,
      'location': location,
      'category': category,
      'contact': contact,
    };
  }

  // Create Listing object from DB Map
  factory Listing.fromMap(Map<String, dynamic> map) {
    return Listing(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      imagePath: map['imagePath'],
      price: map['price'],
      location: map['location'],
      category: map['category'],
      contact: map['contact'],
    );
  }
}

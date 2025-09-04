class PropertyModel {
  final String id;
  final String name;
  final String type;
  final int price;
  final String descript;
  final String city;
  final String quarter;
  final int caution;
  final String contact;
  final List<String> images;
  final List<String> videos;
  final String time;
  final String ownerName;
  final String ownerWhatsapp;
  final DateTime dateAdded;
  final bool isTaken;

  PropertyModel({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.descript,
    required this.city,
    required this.quarter,
    required this.caution,
    required this.contact,
    required this.images,
    required this.videos,
    required this.time,
    required this.ownerName,
    required this.ownerWhatsapp,
    required this.dateAdded,
    this.isTaken = false,
  });

  // Convert to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'price': price,
      'descript': descript,
      'city': city,
      'quarter': quarter,
      'caution': caution,
      'contact': contact,
      'images': images,
      'videos': videos,
      'time': time,
      'ownerName': ownerName,
      'ownerWhatsapp': ownerWhatsapp,
      'dateAdded': dateAdded.toIso8601String(),
      'isTaken': isTaken,
    };
  }

  // Create from JSON
  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      price: json['price'],
      descript: json['description'],
      city: json['city'],
      quarter: json['quarter'],
      caution: json['caution'],
      contact: json['contact'],
      images: List<String>.from(json['images']),
      videos: List<String>.from(json['videos']),
      time: json['time'],
      ownerName: json['ownerName'],
      ownerWhatsapp: json['ownerWhatsapp'],
      dateAdded: DateTime.parse(json['dateAdded']),
      isTaken: json['isTaken'] ?? false,
    );
  }

  // For your existing grid_items.dart compatibility
  String get location => '$quarter, $city';
  String get priceText => 'XAF$price/month';
}

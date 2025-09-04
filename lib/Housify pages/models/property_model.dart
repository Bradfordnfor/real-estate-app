class Property {
  final String id;
  final String name;
  final String type;
  final String location;
  final int bedrooms;
  final bool hasParking;
  final double price;
  final String priceUnit;

  final String imageUrl;
  final DateTime dateAdded;
  final bool isFavorite;

  Property({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.bedrooms,
    required this.hasParking,
    required this.price,
    required this.priceUnit,
    required this.imageUrl,
    required this.dateAdded,
    this.isFavorite = false,
    required String currency,
  });

  Property copyWith({
    String? id,
    String? name,
    String? type,
    String? location,
    int? bedrooms,
    bool? hasParking,
    double? price,
    String? priceUnit,
    String? imageUrl,
    DateTime? dateAdded,
    bool? isFavorite,
  }) {
    return Property(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      location: location ?? this.location,
      bedrooms: bedrooms ?? this.bedrooms,
      hasParking: hasParking ?? this.hasParking,
      price: price ?? this.price,
      priceUnit: priceUnit ?? this.priceUnit,
      imageUrl: imageUrl ?? this.imageUrl,
      dateAdded: dateAdded ?? this.dateAdded,
      isFavorite: isFavorite ?? this.isFavorite,
      currency: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'location': location,
      'bedrooms': bedrooms,
      'hasParking': hasParking,
      'price': price,
      'priceUnit': priceUnit,
      'imageUrl': imageUrl,
      'dateAdded': dateAdded.toIso8601String(),
      'isFavorite': isFavorite,
    };
  }

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      location: json['location'],
      bedrooms: json['bedrooms'],
      hasParking: json['hasParking'],
      price: json['price'].toDouble(),
      priceUnit: json['priceUnit'],
      imageUrl: json['imageUrl'],
      dateAdded: DateTime.parse(json['dateAdded']),
      isFavorite: json['isFavorite'] ?? false,
      currency: '',
    );
  }

  @override
  String toString() {
    return 'Property(id: $id, name: $name, type: $type, location: $location)';
  }
}

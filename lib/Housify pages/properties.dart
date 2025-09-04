import 'package:flutter/material.dart';
import 'package:real_estate_app/Housify%20pages/models/property_model.dart';

import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final Property property;

  const PropertyCard({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          _buildImage(),
          SizedBox(width: 12),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: 120,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(property.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleAndFavorite(),
        SizedBox(height: 2),
        _buildType(),
        SizedBox(height: 4),
        _buildLocation(),
        SizedBox(height: 4),
        _buildFeatures(),
        SizedBox(height: 8),
        _buildPrice(),
      ],
    );
  }

  Widget _buildTitleAndFavorite() {
    return Row(
      children: [
        Expanded(
          child: Text(
            property.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        Icon(
          property.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: property.isFavorite ? Colors.blue : Colors.grey[400],
          size: 20,
        ),
      ],
    );
  }

  Widget _buildType() {
    return Text(
      '(${property.type})',
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey[600],
      ),
    );
  }

  Widget _buildLocation() {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 14,
          color: Colors.grey[500],
        ),
        SizedBox(width: 2),
        Expanded(
          child: Text(
            property.location,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatures() {
    return Row(
      children: [
        Icon(
          Icons.bed_outlined,
          size: 14,
          color: Colors.grey[500],
        ),
        SizedBox(width: 2),
        Text(
          '${property.bedrooms} Bedrooms',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(width: 12),
        if (property.hasParking) ...[
          Icon(
            Icons.local_parking_outlined,
            size: 14,
            color: Colors.grey[500],
          ),
          SizedBox(width: 2),
          Text(
            'Parking Space',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPrice() {
    return Text(
      '${_formatPrice(property.price)}/${property.priceUnit}',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.blue[600],
      ),
    );
  }

  String _formatPrice(double price) {
    return price.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }
}

class SampleData {
  static List<Property> getProperties() {
    return [
      Property(
        id: "1",
        name: "BM Residence",
        type: "Apartment",
        location: "Molyko, Behind Total",
        bedrooms: 4,
        hasParking: true,
        price: 1200000,
        priceUnit: "Year",
        currency: "XAF",
        imageUrl:
            "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400",
        dateAdded: DateTime.now().subtract(Duration(hours: 2)),
        isFavorite: false,
      ),
      Property(
        id: "2",
        name: "The Rich Empire",
        type: "Room",
        location: "Molyko, Behind Total",
        bedrooms: 4,
        hasParking: true,
        price: 1200000,
        priceUnit: "Year",
        currency: "XAF",
        imageUrl:
            "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=400",
        dateAdded: DateTime.now().subtract(Duration(hours: 4)),
        isFavorite: true,
      ),
      Property(
        id: "3",
        name: "Graceland Estate",
        type: "Guest House",
        location: "Molyko, Behind Total",
        bedrooms: 4,
        hasParking: true,
        price: 20000,
        priceUnit: "Night",
        currency: "XAF",
        imageUrl:
            "https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=400",
        dateAdded: DateTime.now().subtract(Duration(days: 1, hours: 3)),
        isFavorite: false,
      ),
      Property(
        id: "4",
        name: "Sunset Villa",
        type: "Apartment",
        location: "Buea Town",
        bedrooms: 2,
        hasParking: false,
        price: 800000,
        priceUnit: "Year",
        currency: "XAF",
        imageUrl:
            "https://images.unsplash.com/photo-1505843513577-22bb7d21e455?w=400",
        dateAdded: DateTime.now().subtract(Duration(days: 2)),
        isFavorite: true,
      ),
      Property(
        id: "5",
        name: "Ocean View Apartment",
        type: "Apartment",
        location: "Limbe Beach",
        bedrooms: 3,
        hasParking: true,
        price: 15000,
        priceUnit: "Night",
        currency: "XAF",
        imageUrl:
            "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=400",
        dateAdded: DateTime.now().subtract(Duration(days: 5)),
        isFavorite: false,
      ),
      Property(
        id: "6",
        name: "Mountain Lodge",
        type: "Guest House",
        location: "Mount Cameroon",
        bedrooms: 6,
        hasParking: true,
        price: 50000,
        priceUnit: "Night",
        currency: "XAF",
        imageUrl:
            "https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=400",
        dateAdded: DateTime.now().subtract(Duration(days: 10)),
        isFavorite: false,
      ),
    ];
  }
}

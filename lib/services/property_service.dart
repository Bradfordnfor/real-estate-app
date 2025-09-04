import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:real_estate_app/models/property_model.dart';

class PropertyService {
  static const String _propertiesKey = 'saved_properties';

  // Save single property
  Future<void> saveProperty(PropertyModel property) async {
    final prefs = await SharedPreferences.getInstance();

    // Get existing properties
    final List<PropertyModel> properties = await getProperties();

    // Add new property
    properties.add(property);

    // Convert to JSON and save
    final List<String> propertiesJson =
        properties.map((property) => jsonEncode(property.toJson())).toList();

    await prefs.setStringList(_propertiesKey, propertiesJson);
  }

  // Get all properties
  Future<List<PropertyModel>> getProperties() async {
    final prefs = await SharedPreferences.getInstance();

    // Get saved properties JSON
    final List<String>? propertiesJson = prefs.getStringList(_propertiesKey);

    if (propertiesJson == null || propertiesJson.isEmpty) {
      return _getSampleProperties(); // Return sample data if no saved properties
    }

    // Convert JSON to PropertyModel objects
    return propertiesJson
        .map((json) => PropertyModel.fromJson(jsonDecode(json)))
        .toList();
  }

  // Delete property
  Future<void> deleteProperty(String propertyId) async {
    final prefs = await SharedPreferences.getInstance();

    // Get existing properties
    final List<PropertyModel> properties = await getProperties();

    // Remove property with matching ID
    properties.removeWhere((property) => property.id == propertyId);

    // Save updated list
    final List<String> propertiesJson =
        properties.map((property) => jsonEncode(property.toJson())).toList();

    await prefs.setStringList(_propertiesKey, propertiesJson);
  }

  // Update property
  Future<void> updateProperty(PropertyModel updatedProperty) async {
    final prefs = await SharedPreferences.getInstance();

    // Get existing properties
    List<PropertyModel> properties = await getProperties();

    // Find and update property
    final index =
        properties.indexWhere((property) => property.id == updatedProperty.id);
    if (index != -1) {
      properties[index] = updatedProperty;

      // Save updated list
      final List<String> propertiesJson =
          properties.map((property) => jsonEncode(property.toJson())).toList();

      await prefs.setStringList(_propertiesKey, propertiesJson);
    }
  }

  // Clear all properties (for testing)
  Future<void> clearAllProperties() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_propertiesKey);
  }

  // Sample properties matching your grid_items data
  List<PropertyModel> _getSampleProperties() {
    return [
      PropertyModel(
        id: '1',
        name: 'Awirna flats',
        type: 'studio',
        price: 70000,
        descript:
            'The Awirna Flats complex is a 1-floor classic studio with very spacious units.',
        city: 'Yaoundé',
        quarter: 'untarred malingo',
        caution: 70000,
        contact: '+237123456789',
        ownerName: 'Nfor Bradford',
        ownerWhatsapp: '+237123456789',
        images: ['assets/im13.jpeg'],
        videos: [],
        time: 'Available now',
        dateAdded: DateTime.now().subtract(Duration(days: 5)),
      ),
      PropertyModel(
        id: '2',
        name: 'Modern Apartment',
        type: 'apartment',
        price: 120000,
        descript: 'Modern 2-bedroom apartment with all amenities included.',
        city: 'Yaoundé',
        quarter: 'bastos',
        caution: 120000,
        contact: '+237987654321',
        ownerName: 'Marie Dubois',
        ownerWhatsapp: '+237987654321',
        images: ['assets/im12.jpeg'],
        videos: [],
        time: 'Available from next month',
        dateAdded: DateTime.now().subtract(Duration(days: 3)),
      ),
      PropertyModel(
        id: '3',
        name: 'Family House',
        type: 'house',
        price: 200000,
        descript: '3-bedroom house perfect for families with garden space.',
        city: 'Yaoundé',
        quarter: 'mendong',
        caution: 200000,
        contact: '+237555666777',
        ownerName: 'Jean Paul',
        ownerWhatsapp: '+237555666777',
        images: ['assets/im11.jpeg'],
        videos: [],
        time: 'Immediate availability',
        dateAdded: DateTime.now().subtract(Duration(days: 1)),
      ),
    ];
  }
}

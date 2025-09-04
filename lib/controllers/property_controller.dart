import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/property_model.dart';
import 'package:real_estate_app/services/property_service.dart';

class PropertyController extends GetxController {
  final PropertyService _propertyService = PropertyService();

  // Observable lists
  final RxList<PropertyModel> properties = <PropertyModel>[].obs;
  final RxList<PropertyModel> filteredProperties = <PropertyModel>[].obs;
  final RxBool isLoading = false.obs;

  // Form controllers for add home
  final TextEditingController homeTypeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController quarterController = TextEditingController();
  final TextEditingController cautionController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController ownerPhoneController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  // Search and filter
  final RxString searchQuery = ''.obs;
  final RxString selectedType = ''.obs;
  final RxString selectedLocation = ''.obs;
  final RxString selectedBudget = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProperties();
    _setupSearchListener();
  }

  // Load properties from storage
  Future<void> loadProperties() async {
    try {
      isLoading.value = true;
      final loadedProperties = await _propertyService.getProperties();
      properties.value = loadedProperties;
      filteredProperties.value = loadedProperties;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load properties');
    } finally {
      isLoading.value = false;
    }
  }

  // Add new property
  Future<void> addProperty() async {
    if (!_validateForm()) return;

    try {
      isLoading.value = true;

      final property = PropertyModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text.trim(),
        type: homeTypeController.text.trim(),
        price: int.tryParse(priceController.text.trim()) ?? 0,
        descript: descriptionController.text.trim(),
        city: cityController.text.trim(),
        quarter: quarterController.text.trim(),
        caution: int.tryParse(cautionController.text.trim()) ?? 0,
        contact: ownerPhoneController.text.trim(),
        ownerName: ownerNameController.text.trim(),
        ownerWhatsapp: ownerPhoneController.text.trim(),
        images: [], // Will add image handling later
        videos: [], // Will add video handling later
        time: timeController.text.trim().isNotEmpty
            ? timeController.text.trim()
            : DateTime.now().toString(),
        dateAdded: DateTime.now(),
      );

      await _propertyService.saveProperty(property);
      properties.add(property);
      filteredProperties.add(property);

      _clearForm();
      Get.snackbar('Success', 'Property added successfully!');
      Get.back(); // Go back to home page
    } catch (e) {
      Get.snackbar('Error', 'Failed to add property');
    } finally {
      isLoading.value = false;
    }
  }

  // Search and filter logic
  void _setupSearchListener() {
    ever(searchQuery, (_) => _filterProperties());
    ever(selectedType, (_) => _filterProperties());
    ever(selectedLocation, (_) => _filterProperties());
    ever(selectedBudget, (_) => _filterProperties());
  }

  void _filterProperties() {
    List<PropertyModel> filtered = List.from(properties);

    // Search by name or location
    if (searchQuery.value.isNotEmpty) {
      filtered = filtered
          .where((property) =>
              property.name
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              property.location
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()))
          .toList();
    }

    // Filter by type
    if (selectedType.value.isNotEmpty) {
      filtered = filtered
          .where((property) => property.type
              .toLowerCase()
              .contains(selectedType.value.toLowerCase()))
          .toList();
    }

    // Filter by location
    if (selectedLocation.value.isNotEmpty) {
      filtered = filtered
          .where((property) => property.location
              .toLowerCase()
              .contains(selectedLocation.value.toLowerCase()))
          .toList();
    }

    filteredProperties.value = filtered;
  }

  // Update search filters
  void updateSearch(String query) => searchQuery.value = query;
  void updateTypeFilter(String type) => selectedType.value = type;
  void updateLocationFilter(String location) =>
      selectedLocation.value = location;
  void updateBudgetFilter(String budget) => selectedBudget.value = budget;

  // Form validation
  bool _validateForm() {
    if (nameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter property name');
      return false;
    }
    if (homeTypeController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter home type');
      return false;
    }
    if (priceController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter price');
      return false;
    }
    if (cityController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter city');
      return false;
    }
    if (quarterController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter quarter');
      return false;
    }
    return true;
  }

  // Clear form
  void _clearForm() {
    homeTypeController.clear();
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    cityController.clear();
    quarterController.clear();
    cautionController.clear();
    ownerNameController.clear();
    ownerPhoneController.clear();
    timeController.clear();
  }

  @override
  void onClose() {
    homeTypeController.dispose();
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    cityController.dispose();
    quarterController.dispose();
    cautionController.dispose();
    ownerNameController.dispose();
    ownerPhoneController.dispose();
    timeController.dispose();
    super.onClose();
  }
}

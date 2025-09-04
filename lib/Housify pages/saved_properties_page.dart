import 'package:flutter/material.dart';
import 'package:real_estate_app/Housify%20pages/filtering_logic.dart';
import 'package:real_estate_app/Housify%20pages/models/property_model.dart';
import 'package:real_estate_app/Housify%20pages/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedPropertiesPage extends StatefulWidget {
  final List<Property> properties;

  const SavedPropertiesPage({Key? key, required this.properties})
      : super(key: key);

  @override
  State<SavedPropertiesPage> createState() => _SavedPropertiesPageState();
}

class _SavedPropertiesPageState extends State<SavedPropertiesPage> {
  FilterType currentFilter = FilterType.alphabeticalAsc;
  List<Property> filteredProperties = [];
  List<PropertyGroup> propertyGroups = [];

  @override
  void initState() {
    super.initState();
    _applyFilter(currentFilter);
  }

  void _onFilterChanged(FilterType newFilter) {
    setState(() {
      currentFilter = newFilter;
    });
    _applyFilter(newFilter);
  }

  void _applyFilter(FilterType filter) {
    setState(() {
      if (filter == FilterType.latest || filter == FilterType.Oldest) {
        propertyGroups = PropertyFilterService.groupPropertiesByDate(
            widget.properties, filter);
        filteredProperties = [];
      } else {
        filteredProperties =
            PropertyFilterService.filterProperties(widget.properties, filter);
        propertyGroups = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CompactFilterDropdown(
            selectedFilter: currentFilter,
            onFilterChanged: _onFilterChanged,
          ),
          Expanded(
            child: PropertyListView(
              currentFilter: currentFilter,
              filteredProperties: filteredProperties,
              propertyGroups: propertyGroups,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:real_estate_app/Housify%20pages/custom_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/Housify%20pages/filtering_logic.dart';
import 'package:real_estate_app/Housify%20pages/models/property_model.dart';
import 'package:real_estate_app/Housify%20pages/properties.dart';

Widget buildRatingBar(int stars, double percentage) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 1),
    child: Row(
      children: [
        Text('$stars',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.amber,
            )),
        SizedBox(width: 4),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 16,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// this part down is for the filtering of different houses by the different categories
enum FilterType {
  alphabeticalAsc,
  alphabeticalDesc,
  latest,
  Oldest,
}

extension FilterTypeExtension on FilterType {
  String get displayName {
    switch (this) {
      case FilterType.alphabeticalAsc:
        return 'A-Z';
      case FilterType.alphabeticalDesc:
        return 'Z-A';
      case FilterType.latest:
        return 'Latest';
      case FilterType.Oldest:
        return 'Oldest';
    }
  }
}

class CompactFilterDropdown extends StatelessWidget {
  final FilterType selectedFilter;
  final Function(FilterType) onFilterChanged;

  const CompactFilterDropdown({
    Key? key,
    required this.selectedFilter,
    required this.onFilterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(6),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<FilterType>(
                  value: selectedFilter,
                  isDense: true,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: Colors.grey,
                  ),
                  style: TextStyle(
                    color: const Color.fromRGBO(102, 102, 102, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  items: FilterType.values.map((FilterType filter) {
                    return DropdownMenuItem<FilterType>(
                      value: filter,
                      child: Text(filter.displayName),
                    );
                  }).toList(),
                  onChanged: (FilterType? newFilter) {
                    if (newFilter != null) {
                      onFilterChanged(newFilter);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyListView extends StatelessWidget {
  final FilterType currentFilter;
  final List<Property> filteredProperties;
  final List<PropertyGroup> propertyGroups;

  const PropertyListView({
    Key? key,
    required this.currentFilter,
    required this.filteredProperties,
    required this.propertyGroups,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPropertyList();
  }

  Widget _buildPropertyList() {
    if (currentFilter == FilterType.latest ||
        currentFilter == FilterType.Oldest) {
      return _buildGroupedList();
    } else {
      return _buildFlatList();
    }
  }

  Widget _buildFlatList() {
    return ListView.builder(
      itemCount: filteredProperties.length,
      itemBuilder: (context, index) {
        return PropertyCard(property: filteredProperties[index]);
      },
    );
  }

  Widget _buildGroupedList() {
    return ListView.builder(
      itemCount: propertyGroups.length,
      itemBuilder: (context, groupIndex) {
        PropertyGroup group = propertyGroups[groupIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                group.sectionTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
            ...group.properties
                .map((property) => PropertyCard(property: property)),
          ],
        );
      },
    );
  }
}

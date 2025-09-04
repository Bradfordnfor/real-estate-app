import 'package:flutter/material.dart';
import 'package:real_estate_app/Housify%20pages/models/property_model.dart';
import 'package:real_estate_app/Housify%20pages/widgets.dart';

class PropertyGroup {
  final String sectionTitle;
  final List<Property> properties;

  PropertyGroup({
    required this.sectionTitle,
    required this.properties,
  });
}

class PropertyFilterService {
  static List<Property> filterProperties(
      List<Property> properties, FilterType filterType) {
    switch (filterType) {
      case FilterType.alphabeticalAsc:
        return _sortAlphabeticallyAsc(properties);
      case FilterType.alphabeticalDesc:
        return _sortAlphabeticallyDesc(properties);
      case FilterType.latest:
        return _sortByLatest(properties);
      case FilterType.Oldest:
        return _sortByOldest(properties);
    }
  }

  static List<Property> _sortAlphabeticallyAsc(List<Property> properties) {
    List<Property> sorted = List.from(properties);
    sorted.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return sorted;
  }

  static List<Property> _sortAlphabeticallyDesc(List<Property> properties) {
    List<Property> sorted = List.from(properties);
    sorted.sort((a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
    return sorted;
  }

  static List<Property> _sortByLatest(List<Property> properties) {
    List<Property> sorted = List.from(properties);
    sorted.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
    return sorted;
  }

  static List<Property> _sortByOldest(List<Property> properties) {
    List<Property> sorted = List.from(properties);
    sorted.sort((a, b) => a.dateAdded.compareTo(b.dateAdded));
    return sorted;
  }

  static List<PropertyGroup> groupPropertiesByDate(
      List<Property> properties, FilterType filterType) {
    List<Property> sortedProperties;
    if (filterType == FilterType.latest) {
      sortedProperties = _sortByLatest(properties);
    } else {
      sortedProperties = _sortByOldest(properties);
    }

    Map<String, List<Property>> groupedMap = {};
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(Duration(days: 1));

    for (Property property in sortedProperties) {
      DateTime propertyDate = DateTime(
        property.dateAdded.year,
        property.dateAdded.month,
        property.dateAdded.day,
      );

      String sectionKey;
      if (propertyDate == today) {
        sectionKey = 'Today';
      } else if (propertyDate == yesterday) {
        sectionKey = 'Yesterday';
      } else {
        sectionKey = _formatDate(property.dateAdded);
      }

      if (!groupedMap.containsKey(sectionKey)) {
        groupedMap[sectionKey] = [];
      }
      groupedMap[sectionKey]!.add(property);
    }

    List<PropertyGroup> groups = [];

    if (groupedMap.containsKey('Today')) {
      groups.add(PropertyGroup(
        sectionTitle: 'Today',
        properties: groupedMap['Today']!,
      ));
    }

    if (groupedMap.containsKey('Yesterday')) {
      groups.add(PropertyGroup(
        sectionTitle: 'Yesterday',
        properties: groupedMap['Yesterday']!,
      ));
    }

    List<String> otherDates = groupedMap.keys
        .where((key) => key != 'Today' && key != 'Yesterday')
        .toList();

    otherDates.sort((a, b) {
      DateTime dateA = _parseFormattedDate(a);
      DateTime dateB = _parseFormattedDate(b);
      if (filterType == FilterType.latest) {
        return dateB.compareTo(dateA);
      } else {
        return dateA.compareTo(dateB);
      }
    });

    for (String dateKey in otherDates) {
      groups.add(PropertyGroup(
        sectionTitle: dateKey,
        properties: groupedMap[dateKey]!,
      ));
    }

    return groups;
  }

  static String _formatDate(DateTime date) {
    List<String> months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${date.day}, ${months[date.month]} ${date.year}';
  }

  static DateTime _parseFormattedDate(String formattedDate) {
    List<String> parts = formattedDate.split(', ');
    if (parts.length != 2) return DateTime.now();

    int day = int.tryParse(parts[0]) ?? 1;
    List<String> monthYear = parts[1].split(' ');
    if (monthYear.length != 2) return DateTime.now();

    Map<String, int> monthMap = {
      'January': 1,
      'February': 2,
      'March': 3,
      'April': 4,
      'May': 5,
      'June': 6,
      'July': 7,
      'August': 8,
      'September': 9,
      'October': 10,
      'November': 11,
      'December': 12
    };

    int month = monthMap[monthYear[0]] ?? 1;
    int year = int.tryParse(monthYear[1]) ?? DateTime.now().year;

    return DateTime(year, month, day);
  }
}

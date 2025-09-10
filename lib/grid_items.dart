import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/details_page.dart';
import 'package:real_estate_app/controllers/property_controller.dart';

class GridItems extends StatefulWidget {
  const GridItems({super.key});

  @override
  State<GridItems> createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  final PropertyController propertyController = Get.find<PropertyController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (propertyController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (propertyController.filteredProperties.isEmpty) {
        return Center(
          child: Text(
            'No properties available',
            style: GoogleFonts.raleway(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        );
      }

      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          mainAxisExtent: 330,
        ),
        itemCount: propertyController.filteredProperties.length,
        itemBuilder: (context, position) {
          final property = propertyController.filteredProperties[position];

          return Card(
            color: Colors.blue,
            elevation: 5,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: property.images.isNotEmpty
                        ? Image.asset(
                            property.images.first,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.home,
                                  size: 50,
                                  color: Colors.grey[600],
                                ),
                              );
                            },
                          )
                        : Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.home,
                              size: 50,
                              color: Colors.grey[600],
                            ),
                          ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      property.name,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(245, 222, 179, 0.9),
                          fontSize: 17),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      property.location,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(245, 222, 179, 0.9),
                          fontSize: 15),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      property.priceText,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 3,
                            shadowColor: Colors.grey.shade200,
                            backgroundColor:
                                Color.fromRGBO(248, 247, 245, 0.694)),
                        onPressed: () {
                          // Pass property data to details page
                          Get.to(() => DetailsPage(), arguments: property);
                        },
                        child: Text(
                          'Details',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      );
    });
  }
}

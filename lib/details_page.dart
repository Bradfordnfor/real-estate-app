import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/appbar.dart';
import 'package:real_estate_app/responsive_layout.dart';
import 'package:real_estate_app/models/property_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  PropertyModel? property;
  int selectedImageIndex = 0;

  @override
  void initState() {
    super.initState();
    // Get the property data passed from the previous page
    property = Get.arguments as PropertyModel?;
  }

  // Function to launch phone call
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      Get.snackbar('Error', 'Could not launch phone call');
    }
  }

  // Function to launch WhatsApp
  void _launchWhatsApp(String phoneNumber) async {
    final Uri launchUri =
        Uri(scheme: 'https', host: 'wa.me', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      Get.snackbar('Error', 'Could not launch WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isWideScreen = screenWidth > 800;
    final isMediumScreen = screenWidth > 600;

    // Responsive dimensions
    final mainImageHeight =
        isWideScreen ? 500.0 : (isMediumScreen ? 350.0 : 280.0);
    final thumbnailHeight =
        isWideScreen ? 120.0 : (isMediumScreen ? 100.0 : 80.0);
    final horizontalPadding =
        isWideScreen ? 40.0 : (isMediumScreen ? 30.0 : 20.0);

    if (property == null) {
      return SafeArea(
        child: ResponsiveLayout(
          backgroundColor: Color.fromRGBO(245, 222, 179, 0.3),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: MyAppBar(),
          ),
          body: Center(
            child: Text(
              'No property data available',
              style: GoogleFonts.raleway(fontSize: 18),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: ResponsiveLayout(
        backgroundColor: Color.fromRGBO(245, 222, 179, 0.3),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MyAppBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property Name and Price
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property!.name,
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w700,
                          fontSize:
                              isWideScreen ? 32 : (isMediumScreen ? 28 : 24),
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        property!.priceText,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize:
                              isWideScreen ? 24 : (isMediumScreen ? 20 : 18),
                          color: Colors.blue.shade700,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        property!.location,
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400,
                          fontSize: isWideScreen ? 18 : 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Main Image
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: mainImageHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: property!.images.isNotEmpty
                          ? Image.asset(
                              property!.images[selectedImageIndex],
                              width: double.infinity,
                              height: mainImageHeight,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.blue,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.home,
                                            size: 60, color: Colors.white),
                                        SizedBox(height: 10),
                                        Text(
                                          'Property Image',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container(
                              color: Colors.blue,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.home,
                                        size: 60, color: Colors.white),
                                    SizedBox(height: 10),
                                    Text(
                                      'No Image Available',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ),
                ),

                // Image/Video Thumbnails
                if (property!.images.length > 1 || property!.videos.isNotEmpty)
                  SizedBox(
                    height: thumbnailHeight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          property!.images.length + property!.videos.length,
                      itemBuilder: (context, index) {
                        final isVideo = index >= property!.images.length;
                        final mediaPath = isVideo
                            ? property!.videos[index - property!.images.length]
                            : property!.images[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () {
                              if (!isVideo) {
                                setState(() {
                                  selectedImageIndex = index;
                                });
                              }
                            },
                            child: Container(
                              height: thumbnailHeight,
                              width: thumbnailHeight * 1.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color:
                                      (!isVideo && selectedImageIndex == index)
                                          ? Colors.blue
                                          : Colors.transparent,
                                  width: 3,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Stack(
                                  children: [
                                    Container(
                                      color: isVideo
                                          ? Colors.black87
                                          : Colors.blue,
                                      child: Center(
                                        child: Icon(
                                          isVideo
                                              ? Icons.play_circle_filled
                                              : Icons.image,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    if (isVideo)
                                      Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            'VIDEO',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                SizedBox(height: 30),

                // Description
                Text(
                  'Description',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    fontSize: isWideScreen ? 24 : 20,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 15),
                ExpandableText(
                  linkEllipsis: true,
                  linkColor: Colors.blue,
                  expandText: "show more",
                  collapseText: "...show less",
                  property!.descript,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w400,
                    fontSize: isWideScreen ? 18 : 16,
                    height: 1.6,
                  ),
                ),

                SizedBox(height: 30),

                // Property Details
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Property Details',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 15),
                      _buildDetailRow('Type:', property!.type.toUpperCase()),
                      _buildDetailRow('Location:', property!.location),
                      _buildDetailRow('Monthly Rent:', property!.priceText),
                      _buildDetailRow(
                          'Caution Deposit:', 'XAF${property!.caution}'),
                      if (property!.time.isNotEmpty)
                        _buildDetailRow('Availability:', property!.time),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Owner Information
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Property Owner',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: isWideScreen ? 35 : 30,
                            child: Text(
                              property!.ownerName.isNotEmpty
                                  ? property!.ownerName[0].toUpperCase()
                                  : 'O',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isWideScreen ? 24 : 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  property!.ownerName,
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w600,
                                    fontSize: isWideScreen ? 20 : 18,
                                  ),
                                ),
                                Text(
                                  'Property Owner',
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () =>
                                    _makePhoneCall(property!.contact),
                                icon: Icon(Icons.call,
                                    color: Colors.green, size: 28),
                                tooltip: 'Call',
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: () =>
                                    _launchWhatsApp(property!.ownerWhatsapp),
                                icon: Icon(FontAwesomeIcons.whatsapp,
                                    color: Colors.green, size: 28),
                                tooltip: 'WhatsApp',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                // Rent Now Button
                Center(
                  child: Container(
                    height: 55,
                    width: isWideScreen ? 200 : 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        // TODO: Implement rent now functionality
                        Get.snackbar('Info', 'Rent functionality coming soon!');
                      },
                      child: Text(
                        'RENT NOW',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

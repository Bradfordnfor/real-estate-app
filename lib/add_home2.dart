import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/appbar.dart';
import 'package:real_estate_app/constants/app_colors.dart';
import 'package:real_estate_app/controllers/property_controller.dart';

class AddAhome2 extends StatefulWidget {
  const AddAhome2({super.key});

  @override
  State<AddAhome2> createState() => _AddAhome2State();
}

class _AddAhome2State extends State<AddAhome2> {
  final PropertyController propertyController = Get.find<PropertyController>();

  bool isActive = false;
  var selectedRadio;
  var selectedRadio2;
  var selectedRadio3;

  List timeRange = [
    'below a minute',
    'below 5 minutes',
    'below 7 minutes',
    'below 10 minutes',
    'above 10 minutes'
  ];
  String? time;

  void activateRadio() {
    setState(() {
      isActive = !isActive;
    });
  }

  List<MediaFile> _selectedFiles = [];

  // Helper functions to get radio button text
  String getBillsText() {
    switch (selectedRadio) {
      case 1:
        return 'Included in rent fee';
      case 2:
        return 'Not included in rent fee';
      default:
        return '';
    }
  }

  String getWaterText() {
    switch (selectedRadio2) {
      case 1:
        return 'Constant water flow indoors';
      case 2:
        return 'Constant water flow outdoors';
      case 3:
        return 'water flow is not constant/no water';
      default:
        return '';
    }
  }

  String getPropertyStateText() {
    switch (selectedRadio3) {
      case 1:
        return 'New property';
      case 2:
        return 'Renewed property';
      case 3:
        return 'Old property';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyAppBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        'Make your empty unit visible.',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          'Bills - water and light.',
                          style: GoogleFonts.openSans(
                              color: const Color.fromRGBO(0, 0, 0, 0.8),
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                          softWrap: true,
                        ),
                      ),
                      RadioListTile(
                        title: Text(
                          'Included in rent fee',
                          style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(0, 0, 0, 0.8),
                            fontSize: 15,
                          ),
                        ),
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          selectedRadio = value;
                          activateRadio();
                        },
                        activeColor: Colors.blue,
                      ),
                      RadioListTile(
                        title: Text(
                          'Not included in rent fee',
                          style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(0, 0, 0, 0.8),
                            fontSize: 15,
                          ),
                        ),
                        value: 2,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          selectedRadio = value;
                          activateRadio();
                        },
                        activeColor: Colors.blue,
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          'Water frequency',
                          style: GoogleFonts.openSans(
                              color: const Color.fromRGBO(0, 0, 0, 0.8),
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                          softWrap: true,
                        ),
                      ),
                      RadioListTile(
                        title: Text(
                          'Constant water flow indoors',
                          style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(0, 0, 0, 0.8),
                            fontSize: 15,
                          ),
                        ),
                        value: 1,
                        groupValue: selectedRadio2,
                        onChanged: (value) {
                          selectedRadio2 = value;
                          activateRadio();
                        },
                        activeColor: Colors.blue,
                      ),
                      RadioListTile(
                        title: Text(
                          'Constant water flow outdoors',
                          style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(0, 0, 0, 0.8),
                            fontSize: 15,
                          ),
                        ),
                        value: 2,
                        groupValue: selectedRadio2,
                        onChanged: (value) {
                          selectedRadio2 = value;
                          activateRadio();
                        },
                        activeColor: Colors.blue,
                      ),
                      RadioListTile(
                        title: Text(
                          'water flow is not constant/no water',
                          style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(0, 0, 0, 0.8),
                            fontSize: 15,
                          ),
                        ),
                        value: 3,
                        groupValue: selectedRadio2,
                        onChanged: (value) {
                          selectedRadio2 = value;
                          activateRadio();
                        },
                        activeColor: Colors.blue,
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          'Property state',
                          style: GoogleFonts.openSans(
                              color: const Color.fromRGBO(0, 0, 0, 0.8),
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                          softWrap: true,
                        ),
                      ),
                      RadioListTile(
                        title: Text(
                          'New property',
                          style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(0, 0, 0, 0.8),
                            fontSize: 15,
                          ),
                        ),
                        value: 1,
                        groupValue: selectedRadio3,
                        onChanged: (value) {
                          selectedRadio3 = value;
                          activateRadio();
                        },
                        activeColor: Colors.blue,
                      ),
                      RadioListTile(
                        title: Text(
                          'Renewed property',
                          style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(0, 0, 0, 0.8),
                            fontSize: 15,
                          ),
                        ),
                        value: 2,
                        groupValue: selectedRadio3,
                        onChanged: (value) {
                          selectedRadio3 = value;
                          activateRadio();
                        },
                        activeColor: Colors.blue,
                      ),
                      RadioListTile(
                        title: Text(
                          'Old property',
                          style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(0, 0, 0, 0.8),
                            fontSize: 15,
                          ),
                        ),
                        value: 3,
                        groupValue: selectedRadio3,
                        onChanged: (value) {
                          selectedRadio3 = value;
                          activateRadio();
                        },
                        activeColor: Colors.blue,
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 20, right: 10),
                        child: DropdownButtonFormField(
                            icon: Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              color: Colors.blue,
                            ),
                            dropdownColor:
                                const Color.fromRGBO(255, 255, 255, 1),
                            decoration: InputDecoration(
                              labelText: 'Walking time from the main road',
                              labelStyle: GoogleFonts.raleway(
                                color: const Color.fromRGBO(0, 0, 0, 0.5),
                                fontSize: 20,
                              ),
                              filled: true,
                              fillColor: Colors.white30,
                              focusColor: Colors.white30,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.2))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            style: TextStyle(color: Colors.black),
                            items: timeRange.map((time) {
                              return DropdownMenuItem(
                                  value: time, child: Text(time));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                time = value as String;
                                // Store time in PropertyController
                                propertyController.timeController.text =
                                    time ?? '';
                              });
                            }),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, top: 20, right: 10),
                        child: TextField(
                          controller: propertyController.descriptionController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.description_outlined,
                              color: Colors.blue,
                            ),
                            helperText:
                                "Provide other advantages/inconveniencies of the property ",
                            helperStyle: GoogleFonts.raleway(
                              color: const Color.fromRGBO(0, 0, 0, 0.8),
                              fontSize: 15,
                            ),
                            labelText: 'Home Description',
                            labelStyle: GoogleFonts.raleway(
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
                              fontSize: 20,
                            ),
                            filled: true,
                            fillColor: Colors.white30,
                            focusColor: Colors.white30,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: const Color.fromRGBO(0, 0, 0, 0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          List<MediaFile> propertyMedia =
                              await GalleryPicker.pickMedia(context: context) ??
                                  [];
                          setState(() {
                            _selectedFiles = propertyMedia;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(19, 18, 18, 0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.upload,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Upload images and videos of the property',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GetBuilder<PropertyController>(
                          builder: (controller) => (_selectedFiles.isNotEmpty ||
                                  (controller.selectedImages?.isNotEmpty ??
                                      false) ||
                                  (controller.selectedVideos?.isNotEmpty ??
                                      false))
                              ? SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(left: 10),
                                      itemCount: (_selectedFiles.length +
                                              propertyController
                                                  .selectedImages.length +
                                              propertyController
                                                  .selectedVideos.length)
                                          .toInt(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 5),
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: AppColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Icon(
                                                    index <
                                                            propertyController
                                                                .selectedImages
                                                                .length
                                                        ? Icons.image
                                                        : Icons.video_file,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 2,
                                                  right: 2,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      if (index <
                                                          propertyController
                                                              .selectedImages
                                                              .length) {
                                                        propertyController
                                                            .removeImage(
                                                                propertyController
                                                                        .selectedImages[
                                                                    index]);
                                                      } else {
                                                        propertyController.removeVideo(
                                                            propertyController
                                                                    .selectedVideos[
                                                                index -
                                                                    propertyController
                                                                        .selectedImages
                                                                        .length]);
                                                      }
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                        size: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              : SizedBox(
                                  height: 30,
                                )),
                      Center(
                        child: Obx(() => Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextButton(
                                  onPressed: propertyController.isLoading.value
                                      ? null
                                      : () async {
                                          // Combine additional info with description
                                          String fullDescription =
                                              propertyController
                                                  .descriptionController.text;
                                          if (getBillsText().isNotEmpty) {
                                            fullDescription +=
                                                '\n\nBills: ${getBillsText()}';
                                          }
                                          if (getWaterText().isNotEmpty) {
                                            fullDescription +=
                                                '\nWater: ${getWaterText()}';
                                          }
                                          if (getPropertyStateText()
                                              .isNotEmpty) {
                                            fullDescription +=
                                                '\nProperty State: ${getPropertyStateText()}';
                                          }
                                          if (time != null) {
                                            fullDescription +=
                                                '\nWalking time from main road: $time';
                                          }

                                          // Update the description with combined info
                                          propertyController
                                              .descriptionController
                                              .text = fullDescription;

                                          // Submit the property
                                          await propertyController
                                              .addProperty();
                                        },
                                  child: propertyController.isLoading.value
                                      ? CircularProgressIndicator(
                                          color: Colors.white)
                                      : Text(
                                          'Add property',
                                          style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.w800,
                                              color: Colors.white,
                                              fontSize: 17),
                                        )),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/appbar.dart';
import 'package:real_estate_app/controllers/property_controller.dart';
import 'package:real_estate_app/add_home2.dart';
import 'package:real_estate_app/responsive_layout.dart';

class AddAHome extends StatefulWidget {
  const AddAHome({super.key});

  @override
  State<AddAHome> createState() => _AddAHomeState();
}

class _AddAHomeState extends State<AddAHome> {
  final PropertyController propertyController = Get.put(PropertyController());

  // Home type options
  final List<String> homeTypes = [
    'studio',
    'apartment',
    'house',
    'villa',
    'duplex',
    'single room'
  ];
  String? selectedHomeType;

  // Cameroon Cities
  final List<String> cameroonCities = [
    'Yaoundé',
    'Douala',
    'Bamenda',
    'Bafoussam',
    'Garoua',
    'Maroua',
    'Ngaoundéré',
    'Kumba',
    'Buea',
    'Limbe',
    'Dschang',
    'Ebolowa',
    'Bertoua',
    'Kribi',
    'Edéa',
    'Foumban',
    'Mbouda',
    'Batouri',
    'Sangmélima',
    'Loum',
    'Kumbo',
    'Nkongsamba',
    'Mbalmayo',
    'Meiganga',
    'Wum',
    'Banyo',
    'Mokolo',
    'Mora',
    'Kousséri',
    'Guider',
    'Kaélé',
    'Yagoua',
    'Poli',
    'Tcholliré',
    'Rey Bouba',
    'Tibati',
    'Tignère',
    'Bankim',
    'Mayo-Oulo',
    'Touboro',
  ];
  String? selectedCity;

  // Validation function
  bool _validateStep1() {
    if (selectedHomeType == null || selectedHomeType!.isEmpty) {
      Get.snackbar('Error', 'Please select home type');
      return false;
    }
    if (propertyController.nameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter property name');
      return false;
    }
    if (propertyController.priceController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter price per month');
      return false;
    }
    if (propertyController.descriptionController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter home description');
      return false;
    }
    if (propertyController.ownerPhoneController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter your phone number');
      return false;
    }
    if (selectedCity == null || selectedCity!.isEmpty) {
      Get.snackbar('Error', 'Please select city');
      return false;
    }
    if (propertyController.quarterController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter quarter');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
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
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropdownButtonFormField<String>(
                  value: selectedHomeType,
                  decoration: InputDecoration(
                    labelText: 'Home Type',
                    labelStyle: GoogleFonts.raleway(
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 20,
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(245, 222, 179, 0.05),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 1, color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  items: homeTypes.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedHomeType = value;
                      propertyController.homeTypeController.text = value ?? '';
                    });
                  },
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: propertyController.nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: GoogleFonts.raleway(
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 20,
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(245, 222, 179, 0.05),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 1, color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  cursorColor: Color.fromRGBO(245, 222, 179, 0.5),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: propertyController.priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Price per month',
                    labelStyle: GoogleFonts.raleway(
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 20,
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(245, 222, 179, 0.05),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 1, color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  cursorColor: Color.fromRGBO(245, 222, 179, 0.5),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: propertyController.descriptionController,
                  maxLines: 2,
                  decoration: InputDecoration(
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
                    fillColor: Color.fromRGBO(245, 222, 179, 0.05),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 1, color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  cursorColor: Color.fromRGBO(245, 222, 179, 0.5),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: propertyController.ownerPhoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Your Phone Number',
                    labelStyle: GoogleFonts.raleway(
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 20,
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(245, 222, 179, 0.05),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 1, color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  cursorColor: Color.fromRGBO(245, 222, 179, 0.5),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DropdownButtonFormField<String>(
                        value: selectedCity,
                        decoration: InputDecoration(
                          labelText: 'City/Town',
                          labelStyle: GoogleFonts.raleway(
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                            fontSize: 18,
                          ),
                          filled: true,
                          fillColor: Color.fromRGBO(245, 222, 179, 0.05),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        items: cameroonCities.map((city) {
                          return DropdownMenuItem(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCity = value;
                            propertyController.cityController.text =
                                value ?? '';
                          });
                        },
                        style: TextStyle(color: Colors.black),
                        isExpanded: true,
                        menuMaxHeight: 200,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                      child: TextField(
                        controller: propertyController.quarterController,
                        decoration: InputDecoration(
                          labelText: 'Quarter',
                          labelStyle: GoogleFonts.raleway(
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                            fontSize: 18,
                          ),
                          filled: true,
                          fillColor: Color.fromRGBO(245, 222, 179, 0.05),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        cursorColor: Color.fromRGBO(245, 222, 179, 0.5),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_validateStep1()) {
                        Get.to(() => AddAhome2());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'PROCEED',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

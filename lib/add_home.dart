import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:real_estate_app/add_home2.dart';
import 'package:real_estate_app/appbar.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddAHome extends StatefulWidget {
  const AddAHome({super.key});

  @override
  State<AddAHome> createState() => _AddAHomeState();
}

class _AddAHomeState extends State<AddAHome> {
  String? _homeType;
  String? initialDeposit;
  List homeTypes = ['Single rooms', 'studio', 'apartment'];
  List months = ['3 months', '6 months', '8 months', '10 months', '12 months'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(),
      ),
      body: Padding(
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 60),
              child: DropdownButtonFormField(
                items: homeTypes.map((homeType) {
                  return DropdownMenuItem(
                    value: homeType,
                    child: Text(homeType),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _homeType = value as String;
                  });
                },
                value: _homeType,
                decoration: InputDecoration(
                  labelText: 'Home Type',
                  labelStyle: GoogleFonts.raleway(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white30,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1, color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: GoogleFonts.raleway(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white30,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1, color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 60),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  labelText: 'Price per month',
                  labelStyle: GoogleFonts.raleway(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white30,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1, color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 60),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  labelText: 'Caution fee',
                  labelStyle: GoogleFonts.raleway(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white30,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1, color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 60),
              child: DropdownButtonFormField(
                items: months.map((deposits) {
                  return DropdownMenuItem(
                    value: deposits,
                    child: Text(deposits),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    initialDeposit = value as String;
                  });
                },
                value: initialDeposit,
                decoration: InputDecoration(
                  labelText: 'Initial deposit',
                  labelStyle: GoogleFonts.raleway(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white30,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1, color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  labelStyle: GoogleFonts.raleway(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white30,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1, color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Just a few clicks away...',
                  style: GoogleFonts.raleway(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    onPressed: () {
                      Get.to(AddAhome2());
                    },
                    child: Text(
                      'Proceed',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 15),
                    ))
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

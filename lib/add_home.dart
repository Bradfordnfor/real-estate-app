import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/appbar.dart';

class AddAHome extends StatefulWidget {
  const AddAHome({super.key});

  @override
  State<AddAHome> createState() => _AddAHomeState();
}

class _AddAHomeState extends State<AddAHome> {
  String? _homeType;
  List homeTypes = ['Single rooms', 'studio', 'apartment'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: DropdownButtonFormField(
                items: homeTypes.map((_homeType) {
                  return DropdownMenuItem(
                    value: _homeType,
                    child: Text(_homeType),
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
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
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
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
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
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                maxLines: 2,
                decoration: InputDecoration(
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
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/appbar.dart';

class AddAhome2 extends StatefulWidget {
  const AddAhome2({super.key});

  @override
  State<AddAhome2> createState() => _AddAhome2State();
}

class _AddAhome2State extends State<AddAhome2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 222, 179, 0.3),
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
              ],
            )));
  }
}

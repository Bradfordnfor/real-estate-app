import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/add_home.dart';
import 'package:real_estate_app/appbar.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 222, 179, 0.3),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          height: double.infinity,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Description',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ),
              ExpandableText(
                maxLines: 1,
                linkEllipsis: true,
                linkColor: Colors.blue,
                expandText: "show more",
                collapseText: "...show less",
                'The Awirna Flats complex is a 1-floor clasic studion with very spacious units. The rent is paid yearly; thats is , an initial deposit of 12 months and 1 month caution fee in addition to XAF 60,000 for a yearly water bill is deposited along making a total deposit of XAF 970,000.Each unit takes care of their light bill. It is situated at untarred malingo beside white house',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w300, fontSize: 20),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                    ),
                    title: Text(
                      'Nfor Bradford',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'House owner',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          // child: Container(
                          // decoration: BoxDecoration(
                          //     color: Colors.blue,
                          //     borderRadius: BorderRadius.circular(15)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.call,
                                // color: Colors.white,
                              )),
                          // ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          // child: Container(
                          // decoration: BoxDecoration(
                          //     color: Colors.blue,
                          //     borderRadius: BorderRadius.circular(15)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.whatsapp,
                                // color: Colors.white,
                              )),
                          // ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Center(
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                        onPressed: () {
                          Get.to(AddAHome());
                        },
                        child: Text(
                          'RENT NOW',
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 17),
                        )),
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/details_page.dart';

class GridItems extends StatefulWidget {
  const GridItems({super.key});

  @override
  State<GridItems> createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  final List<Map<String, dynamic>> homeDetails = [
    {
      "name": "Awirna flats",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im13.jpeg"
    },
    {
      "name": "Aw",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im12.jpeg"
    },
    {
      "name": "Awi",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im11.jpeg"
    },
    {
      "name": "Awir",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im10.jpeg"
    },
    {
      "name": "Awirn",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im9.jpeg"
    },
    {
      "name": "Awirna ",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im8.jpeg"
    },
    {
      "name": "Awirna f",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im7.jpeg"
    },
    {
      "name": "Awirna fl",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im6.jpeg"
    },
    {
      "name": "Awirna fla",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im5.jpeg"
    },
    {
      "name": "Awirna flat",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im4.jpeg"
    },
    {
      "name": "Awirna flats",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im3.jpeg"
    },
    {
      "name": "Awirna flats12",
      "type": "studio",
      "price": "XAF70,000/month",
      "location": "untarred malingo",
      "image": "assets/im2.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          mainAxisExtent: 330,
        ),
        itemCount: homeDetails.length,
        itemBuilder: (context, position) {
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
                    child: Image.asset(
                      "${homeDetails.elementAt(position)['image']}",
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "${homeDetails.elementAt(position)['name']}",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(245, 222, 179, 0.9),
                          fontSize: 17),
                    ),
                    Text(
                      "${homeDetails.elementAt(position)['location']}",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(245, 222, 179, 0.9),
                          fontSize: 15),
                    ),
                    Text(
                      "${homeDetails.elementAt(position)['price']}",
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
                          Get.to(DetailsPage());
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
        });
  }
}

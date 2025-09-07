import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      backgroundColor: Colors.blue,
      shadowColor: Colors.grey,
      automaticallyImplyLeading: false, // Remove drawer icon completely
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/Component 1 (2).png',
          height: 50,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            'HOMZ',
            textAlign: TextAlign.center,
            style: GoogleFonts.ebGaramond(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          Spacer(),
          // Only show these icons on small screens
          if (!isWideScreen) ...[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 25,
                  color: Colors.white,
                )),
            SizedBox(width: 10),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 25,
                  color: Colors.white,
                ))
          ],
        ],
      ),
    );
  }
}

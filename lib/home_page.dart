import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 222, 179, 0.3),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue,
            shadowColor: Colors.grey,
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
            title: Text(
              'HOMZ',
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    size: 25,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    size: 25,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.view_headline,
                    size: 25,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 0, left: 25, right: 0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide.none,
                              top: BorderSide(
                                  width: 2,
                                  color:
                                      const Color.fromRGBO(33, 150, 243, 0.5)),
                              bottom: BorderSide(
                                  width: 2,
                                  color:
                                      const Color.fromRGBO(33, 150, 243, 0.5)),
                              left: BorderSide(
                                  width: 2,
                                  color:
                                      const Color.fromRGBO(33, 150, 243, 0.5))),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: TextField(
                        textAlign: TextAlign.center,
                        cursorColor: const Color.fromRGBO(0, 0, 0, 0.5),
                        decoration: InputDecoration(
                          hintText: 'Home type',
                          hintStyle: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          fillColor: Color.fromRGBO(0, 0, 0, 0),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromRGBO(33, 150, 243, 0.5),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 0, left: 0, right: 0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              vertical: BorderSide.none,
                              horizontal: BorderSide(
                                  width: 2,
                                  color: const Color.fromRGBO(
                                      33, 150, 243, 0.5)))),
                      child: TextField(
                        textAlign: TextAlign.center,
                        cursorColor: const Color.fromRGBO(0, 0, 0, 0.5),
                        decoration: InputDecoration(
                          hintText: 'Location',
                          hintStyle: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          fillColor: Color.fromRGBO(0, 0, 0, 0),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromRGBO(33, 150, 243, 0.5),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 0, left: 0, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide.none,
                              top: BorderSide(
                                  width: 2,
                                  color:
                                      const Color.fromRGBO(33, 150, 243, 0.5)),
                              bottom: BorderSide(
                                  width: 2,
                                  color:
                                      const Color.fromRGBO(33, 150, 243, 0.5)),
                              right: BorderSide(
                                  width: 2,
                                  color:
                                      const Color.fromRGBO(33, 150, 243, 0.5))),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: TextField(
                        textAlign: TextAlign.center,
                        cursorColor: const Color.fromRGBO(0, 0, 0, 0.5),
                        decoration: InputDecoration(
                          hintText: 'Budget',
                          hintStyle: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          fillColor: Color.fromRGBO(0, 0, 0, 0),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromRGBO(33, 150, 243, 0.5),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                        tooltip: 'search',
                        onPressed: () {},
                        icon: Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 2.45),
                    itemCount: 10,
                    itemBuilder: (context, position) {
                      return Card(
                        color: Colors.blue,
                        child: Center(child: Text('box ${position + 1}')),
                      );
                    }),
              ),
            ),
          ],
        ));
  }
}

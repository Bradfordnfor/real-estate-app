import 'package:flutter/material.dart';

import 'package:real_estate_app/appbar.dart';
import 'package:real_estate_app/grid_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          endDrawer: Drawer(),
          backgroundColor: Colors.blue.shade50,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60), child: MyAppBar()),
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
                                    color: const Color.fromRGBO(
                                        33, 150, 243, 0.5)),
                                bottom: BorderSide(
                                    width: 2,
                                    color: const Color.fromRGBO(
                                        33, 150, 243, 0.5)),
                                left: BorderSide(
                                    width: 2,
                                    color: const Color.fromRGBO(
                                        33, 150, 243, 0.5))),
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
                                  color:
                                      const Color.fromRGBO(33, 150, 243, 0.5),
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
                                  color:
                                      const Color.fromRGBO(33, 150, 243, 0.5),
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
                                    color: const Color.fromRGBO(
                                        33, 150, 243, 0.5)),
                                bottom: BorderSide(
                                    width: 2,
                                    color: const Color.fromRGBO(
                                        33, 150, 243, 0.5)),
                                right: BorderSide(
                                    width: 2,
                                    color: const Color.fromRGBO(
                                        33, 150, 243, 0.5))),
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
                                  color:
                                      const Color.fromRGBO(33, 150, 243, 0.5),
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
                  child: GridItems(),
                ),
              ),
            ],
          )),
    );
  }
}

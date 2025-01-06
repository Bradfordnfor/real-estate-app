import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/home_page.dart';
import 'package:real_estate_app/signup_page.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 222, 179, 0.3),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/backgroundhouse.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/polygon.png',
                      fit: BoxFit.fitWidth,
                      color: const Color.fromRGBO(60, 163, 247, 1),
                    ))
              ],
            ),
            Positioned(
              top: 250,
              bottom: 50,
              left: 40,
              right: 40,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: Color.fromRGBO(60, 163, 247, 0.6),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/Component 1 (2).png'),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'HOMZ',
                          style: GoogleFonts.ebGaramond(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'User name',
                          labelStyle: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(245, 222, 179, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(245, 222, 179, 1),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        cursorColor: Color.fromRGBO(245, 222, 179, 0.5),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(255, 255, 255, 1),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(245, 222, 179, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(245, 222, 179, 1),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        cursorColor: Color.fromRGBO(245, 222, 179, 0.5),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(HomePage());
                      },
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(245, 222, 179, 1),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 50),
                      child: ListTile(
                        leading: Checkbox(
                            activeColor: Color.fromRGBO(245, 222, 179, 1),
                            checkColor: Colors.white,
                            side: BorderSide(
                              color: Color.fromRGBO(245, 222, 179, 1),
                            ),
                            value: isChecked,
                            onChanged: (newvalue) {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            }),
                        title: Text(
                          'Remember Password',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(245, 222, 179, 1)),
                        ),
                        trailing: GestureDetector(
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Color.fromRGBO(245, 222, 179, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account yet?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(Signup());
                          },
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: Color.fromRGBO(245, 222, 179, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

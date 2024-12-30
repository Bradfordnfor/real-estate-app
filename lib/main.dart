import 'package:flutter/material.dart';
import 'package:real_estate_app/home_page.dart';
import 'package:get/get.dart';
// import 'package:real_estate_app/signup_page.dart';
// import 'package:real_estate_app/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

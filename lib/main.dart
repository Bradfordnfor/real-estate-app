import 'package:flutter/material.dart';
import 'package:real_estate_app/add_home.dart';
import 'package:real_estate_app/details_page.dart';
import 'package:real_estate_app/home_page.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/signup_page.dart';
import 'package:real_estate_app/controllers/property_controller.dart';
import 'package:real_estate_app/controllers/auth_controller.dart';

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
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.put(PropertyController());
      }),
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Obx(() {
      if (authController.isLoggedIn.value) {
        return HomePage();
      } else {
        return Signup();
      }
    });
  }
}

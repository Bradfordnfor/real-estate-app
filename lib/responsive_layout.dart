import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/add_home.dart';
import 'package:real_estate_app/controllers/auth_controller.dart';
import 'package:real_estate_app/controllers/property_controller.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool showDrawer;
  final Color? backgroundColor;

  const ResponsiveLayout({
    Key? key,
    required this.body,
    this.appBar,
    this.showDrawer = true,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: backgroundColor ?? Color.fromRGBO(245, 222, 179, 0.3),
      appBar: appBar,
      drawer: (!isWideScreen && showDrawer) ? _buildDrawer() : null,
      body: Row(
        children: [
          // Permanent drawer for wide screens
          if (isWideScreen && showDrawer)
            SizedBox(
              width: 280,
              child: _buildDrawer(),
            ),
          // Main content
          Expanded(child: body),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          // Custom Header with Logo and App Name
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Component 1 (2).png',
                  height: 80,
                  width: 80,
                ),
                SizedBox(height: 10),
                Text(
                  'HOMZ',
                  style: GoogleFonts.ebGaramond(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                GetBuilder<AuthController>(
                  init: Get.find<AuthController>(),
                  builder: (authController) => Obx(() => Text(
                        authController.currentUserEmail.value.isNotEmpty
                            ? authController.currentUserEmail.value
                            : 'Guest User',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: Icon(Icons.home, color: Colors.blue),
                  title: Text('Home'),
                  onTap: () {
                    if (MediaQuery.of(Get.context!).size.width <= 800) {
                      Get.back();
                    }
                    Get.offAllNamed('/home');
                  },
                ),
                GetBuilder<AuthController>(
                  init: Get.find<AuthController>(),
                  builder: (authController) => Obx(() => authController
                              .currentUserCategory.value ==
                          'House keeper/owner'
                      ? ListTile(
                          leading: Icon(Icons.add_home, color: Colors.blue),
                          title: Text('Add Property'),
                          onTap: () {
                            if (MediaQuery.of(Get.context!).size.width <= 800) {
                              Get.back();
                            }
                            Get.to(() => AddAHome());
                          },
                        )
                      : SizedBox.shrink()),
                ),
                ListTile(
                  leading: Icon(Icons.refresh, color: Colors.blue),
                  title: Text('Refresh Properties'),
                  onTap: () {
                    if (MediaQuery.of(Get.context!).size.width <= 800) {
                      Get.back();
                    }
                    Get.find<PropertyController>().loadProperties();
                    Get.snackbar('Success', 'Properties refreshed');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.search, color: Colors.blue),
                  title: Text('Search Properties'),
                  onTap: () {
                    if (MediaQuery.of(Get.context!).size.width <= 800) {
                      Get.back();
                    }
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text('Profile'),
                  onTap: () {
                    if (MediaQuery.of(Get.context!).size.width <= 800) {
                      Get.back();
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.blue),
                  title: Text('Settings'),
                  onTap: () {
                    if (MediaQuery.of(Get.context!).size.width <= 800) {
                      Get.back();
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Sign Out'),
                  onTap: () async {
                    if (MediaQuery.of(Get.context!).size.width <= 800) {
                      Get.back();
                    }
                    await Get.find<AuthController>().signOut();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} // TODO Implement this library.

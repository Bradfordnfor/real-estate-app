import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/add_home.dart';
import 'package:real_estate_app/controllers/auth_controller.dart';
import 'package:real_estate_app/controllers/property_controller.dart';

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
      automaticallyImplyLeading:
          !isWideScreen, // Hide hamburger on wide screens
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      leading: isWideScreen
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/Component 1 (2).png',
                height: 50,
              ),
            ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isWideScreen) Spacer(),
          Text(
            'HOMZ',
            textAlign: TextAlign.center,
            style: GoogleFonts.ebGaramond(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          if (!isWideScreen) Spacer(),
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
                )),
          ],
        ],
      ),
    );
  }
}

// Responsive Drawer Widget
class ResponsiveDrawer extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final PropertyController propertyController = Get.find<PropertyController>();

  @override
  Widget build(BuildContext context) {
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
                Obx(() => Text(
                      authController.currentUserEmail.value.isNotEmpty
                          ? authController.currentUserEmail.value
                          : 'Guest User',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    )),
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
                    if (MediaQuery.of(context).size.width <= 800) {
                      Get.back();
                    }
                  },
                ),
                Obx(() => authController.currentUserCategory.value ==
                        'House keeper/owner'
                    ? ListTile(
                        leading: Icon(Icons.add_home, color: Colors.blue),
                        title: Text('Add Property'),
                        onTap: () {
                          if (MediaQuery.of(context).size.width <= 800) {
                            Get.back();
                          }
                          Get.to(() => AddAHome());
                        },
                      )
                    : SizedBox.shrink()),
                ListTile(
                  leading: Icon(Icons.refresh, color: Colors.blue),
                  title: Text('Refresh Properties'),
                  onTap: () {
                    if (MediaQuery.of(context).size.width <= 800) {
                      Get.back();
                    }
                    propertyController.loadProperties();
                    Get.snackbar('Success', 'Properties refreshed');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.search, color: Colors.blue),
                  title: Text('Search Properties'),
                  onTap: () {
                    if (MediaQuery.of(context).size.width <= 800) {
                      Get.back();
                    }
                    // Focus on search fields
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text('Profile'),
                  onTap: () {
                    if (MediaQuery.of(context).size.width <= 800) {
                      Get.back();
                    }
                    // Navigate to profile
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.blue),
                  title: Text('Settings'),
                  onTap: () {
                    if (MediaQuery.of(context).size.width <= 800) {
                      Get.back();
                    }
                    // Navigate to settings
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Sign Out'),
                  onTap: () async {
                    if (MediaQuery.of(context).size.width <= 800) {
                      Get.back();
                    }
                    await authController.signOut();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

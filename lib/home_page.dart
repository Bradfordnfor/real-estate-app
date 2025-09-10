import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/appbar.dart';
import 'package:real_estate_app/grid_items.dart';
import 'package:real_estate_app/controllers/property_controller.dart';
import 'package:real_estate_app/controllers/auth_controller.dart';
import 'package:real_estate_app/add_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PropertyController propertyController = Get.find<PropertyController>();
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController homeTypeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();

  @override
  void dispose() {
    homeTypeController.dispose();
    locationController.dispose();
    budgetController.dispose();
    super.dispose();
  }

  void _performSearch() {
    propertyController.updateTypeFilter(homeTypeController.text);
    propertyController.updateLocationFilter(locationController.text);
    propertyController.updateBudgetFilter(budgetController.text);
  }

  Widget _buildPermanentDrawer() {
    return Container(
      width: 280,
      color: Colors.white,
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
                  onTap: () {},
                ),
                Obx(() => authController.currentUserCategory.value ==
                        'House keeper/owner'
                    ? ListTile(
                        leading: Icon(Icons.add_home, color: Colors.blue),
                        title: Text('Add Property'),
                        onTap: () => Get.to(() => AddAHome()),
                      )
                    : SizedBox.shrink()),
                ListTile(
                  leading: Icon(Icons.refresh, color: Colors.blue),
                  title: Text('Refresh Properties'),
                  onTap: () {
                    propertyController.loadProperties();
                    Get.snackbar('Success', 'Properties refreshed');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.search, color: Colors.blue),
                  title: Text('Search Properties'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.blue),
                  title: Text('Notifications'),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text('Profile'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.blue),
                  title: Text('Settings'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Sign Out'),
                  onTap: () async {
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

  Widget _buildMobileDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Image.asset(
                  'assets/Component 1 (2).png',
                  height: 60,
                  width: double.infinity,
                ),
                SizedBox(height: 10),
                Text(
                  'HOMZ',
                  style: GoogleFonts.ebGaramond(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () => Get.back(),
                ),
                Obx(() => authController.currentUserCategory.value ==
                        'House keeper/owner'
                    ? ListTile(
                        leading: Icon(Icons.add_home),
                        title: Text('Add Property'),
                        onTap: () {
                          Get.back();
                          Get.to(() => AddAHome());
                        },
                      )
                    : SizedBox.shrink()),
                ListTile(
                  leading: Icon(Icons.refresh),
                  title: Text('Refresh Properties'),
                  onTap: () {
                    Get.back();
                    propertyController.loadProperties();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Sign Out'),
                  onTap: () async {
                    Get.back();
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

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(245, 222, 179, 0.3),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), child: MyAppBar()),
        endDrawer: !isWideScreen ? _buildMobileDrawer() : null,
        body: Row(
          children: [
            // Permanent drawer for wide screens
            if (isWideScreen) _buildPermanentDrawer(),
            // Main content
            Expanded(
              child: Column(
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
                              controller: homeTypeController,
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
                                      color: const Color.fromRGBO(
                                          33, 150, 243, 0.5),
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
                              controller: locationController,
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
                                      color: const Color.fromRGBO(
                                          33, 150, 243, 0.5),
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
                              controller: budgetController,
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
                                      color: const Color.fromRGBO(
                                          33, 150, 243, 0.5),
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
                              onPressed: _performSearch,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

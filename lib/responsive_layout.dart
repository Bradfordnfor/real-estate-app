import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/add_home.dart';
import 'package:real_estate_app/home_page.dart';
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

  void _navigateToHome() {
    // Navigate to home only if not already on home page
    if (Get.currentRoute != '/HomePage') {
      Get.offAll(() => HomePage());
    }
  }

  void _navigateToAddProperty() {
    // Navigate to add property page
    Get.to(() => AddAHome());
  }

  void _refreshProperties() {
    try {
      Get.find<PropertyController>().loadProperties();
      Get.snackbar(
        'Success',
        'Properties refreshed!',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to refresh properties');
    }
  }

  void _showNotifications() {
    Get.snackbar(
      'Notifications',
      'No new notifications',
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );
  }

  void _showProfile() {
    final authController = Get.find<AuthController>();
    Get.dialog(
      AlertDialog(
        title: Text('Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${authController.currentUserEmail.value}'),
            SizedBox(height: 10),
            Text('Category: ${authController.currentUserCategory.value}'),
            SizedBox(height: 10),
            Text('Status: Active'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showSettings() {
    Get.dialog(
      AlertDialog(
        title: Text('Settings'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              subtitle: Text('English'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Dark Mode'),
              subtitle: Text('Light'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text('Notifications'),
              subtitle: Text('Enabled'),
              onTap: () {},
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _performSearch() {
    // Focus on search functionality
    Get.snackbar(
      'Search',
      'Use the search fields above to find properties',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  Future<void> _signOut() async {
    Get.dialog(
      AlertDialog(
        title: Text('Sign Out'),
        content: Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Get.back();
              await Get.find<AuthController>().signOut();
            },
            child: Text('Sign Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: backgroundColor ?? Color.fromRGBO(245, 222, 179, 0.3),
      appBar: appBar,
      drawer: (!isWideScreen && showDrawer) ? _buildMobileDrawer() : null,
      body: Row(
        children: [
          // Permanent drawer for wide screens
          if (isWideScreen && showDrawer)
            SizedBox(
              width: 280,
              child: _buildPermanentDrawer(),
            ),
          // Main content
          Expanded(child: body),
        ],
      ),
    );
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
                  onTap: _navigateToHome,
                ),
                GetBuilder<AuthController>(
                  init: Get.find<AuthController>(),
                  builder: (authController) => Obx(() =>
                      authController.currentUserCategory.value ==
                              'House keeper/owner'
                          ? ListTile(
                              leading: Icon(Icons.add_home, color: Colors.blue),
                              title: Text('Add Property'),
                              onTap: _navigateToAddProperty,
                            )
                          : SizedBox.shrink()),
                ),
                ListTile(
                  leading: Icon(Icons.refresh, color: Colors.blue),
                  title: Text('Refresh Properties'),
                  onTap: _refreshProperties,
                ),
                ListTile(
                  leading: Icon(Icons.search, color: Colors.blue),
                  title: Text('Search Properties'),
                  onTap: _performSearch,
                ),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.blue),
                  title: Text('Notifications'),
                  onTap: _showNotifications,
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text('Profile'),
                  onTap: _showProfile,
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.blue),
                  title: Text('Settings'),
                  onTap: _showSettings,
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Sign Out'),
                  onTap: _signOut,
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
                  leading: Icon(Icons.search, color: Colors.blue),
                  title: Text('Search Properties'),
                  onTap: () {
                    Get.back();
                    _performSearch();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.search, color: Colors.blue),
                  title: Text('Search Properties'),
                  onTap: () {
                    Get.back();
                    _performSearch();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.blue),
                  title: Text('Notifications'),
                  onTap: () {
                    Get.back();
                    _showNotifications();
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text('Profile'),
                  onTap: () {
                    Get.back();
                    _showProfile();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.blue),
                  title: Text('Settings'),
                  onTap: () {
                    Get.back();
                    _showSettings();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.blue),
                  title: Text('Notifications'),
                  onTap: () {
                    Get.back();
                    _showNotifications();
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text('Profile'),
                  onTap: () {
                    Get.back();
                    _showProfile();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.blue),
                  title: Text('Settings'),
                  onTap: () {
                    Get.back();
                    _showSettings();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home, color: Colors.blue),
                  title: Text('Home'),
                  onTap: () {
                    Get.back();
                    _navigateToHome();
                  },
                ),
                GetBuilder<AuthController>(
                  init: Get.find<AuthController>(),
                  builder: (authController) => Obx(() =>
                      authController.currentUserCategory.value ==
                              'House keeper/owner'
                          ? ListTile(
                              leading: Icon(Icons.add_home, color: Colors.blue),
                              title: Text('Add Property'),
                              onTap: () {
                                Get.back();
                                _navigateToAddProperty();
                              },
                            )
                          : SizedBox.shrink()),
                ),
                ListTile(
                  leading: Icon(Icons.refresh, color: Colors.blue),
                  title: Text('Refresh Properties'),
                  onTap: () {
                    Get.back();
                    _refreshProperties();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.search, color: Colors.blue),
                  title: Text('Search Properties'),
                  onTap: () {
                    Get.back();
                    _performSearch();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.blue),
                  title: Text('Notifications'),
                  onTap: () {
                    Get.back();
                    _showNotifications();
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text('Profile'),
                  onTap: () {
                    Get.back();
                    _showProfile();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.blue),
                  title: Text('Settings'),
                  onTap: () {
                    Get.back();
                    _showSettings();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Sign Out'),
                  onTap: () {
                    Get.back();
                    _signOut();
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

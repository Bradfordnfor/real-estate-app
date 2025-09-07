import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:real_estate_app/home_page.dart';

class AuthController extends GetxController {
  static const String _usersKey = 'registered_users';
  static const String _currentUserKey = 'current_user';

  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;
  final RxString currentUserEmail = ''.obs;
  final RxString currentUserCategory = ''.obs;

  // Form controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController loginUsernameController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  // Check if user is already logged in
  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUser = prefs.getString(_currentUserKey);

    if (currentUser != null) {
      final userData = jsonDecode(currentUser);
      currentUserEmail.value = userData['email'];
      currentUserCategory.value = userData['category'];
      isLoggedIn.value = true;
    }
  }

  // Sign up new user
  Future<void> signUp(String category) async {
    if (!_validateSignUpForm(category)) return;

    try {
      isLoading.value = true;

      final prefs = await SharedPreferences.getInstance();

      // Get existing users
      final usersJson = prefs.getStringList(_usersKey) ?? [];
      final users = usersJson.map((json) => jsonDecode(json)).toList();

      // Check if user already exists
      final existingUser = users.firstWhereOrNull((user) =>
          user['email'] == emailController.text.trim().toLowerCase() ||
          user['username'] == usernameController.text.trim().toLowerCase());

      if (existingUser != null) {
        Get.snackbar(
            'Error', 'User with this email or username already exists');
        return;
      }

      // Create new user
      final newUser = {
        'username': usernameController.text.trim(),
        'email': emailController.text.trim().toLowerCase(),
        'password': passwordController.text.trim(),
        'category': category,
        'createdAt': DateTime.now().toIso8601String(),
      };

      users.add(newUser);

      // Save users
      final updatedUsersJson = users.map((user) => jsonEncode(user)).toList();
      await prefs.setStringList(_usersKey, updatedUsersJson);

      // Set current user
      await prefs.setString(_currentUserKey, jsonEncode(newUser));

      currentUserEmail.value = newUser['email']!;
      currentUserCategory.value = newUser['category']!;
      isLoggedIn.value = true;

      _clearSignUpForm();
      Get.snackbar('Success', 'Account created successfully!');
      Get.offAll(() => HomePage());
    } catch (e) {
      Get.snackbar('Error', 'Failed to create account');
    } finally {
      isLoading.value = false;
    }
  }

  // Sign in existing user
  Future<void> signIn() async {
    if (!_validateSignInForm()) return;

    try {
      isLoading.value = true;

      final prefs = await SharedPreferences.getInstance();

      // Get existing users
      final usersJson = prefs.getStringList(_usersKey) ?? [];
      final users = usersJson.map((json) => jsonDecode(json)).toList();

      // Find user by username or email
      final user = users.firstWhereOrNull((user) =>
          (user['email'] == loginUsernameController.text.trim().toLowerCase() ||
              user['username'] ==
                  loginUsernameController.text.trim().toLowerCase()) &&
          user['password'] == loginPasswordController.text.trim());

      if (user == null) {
        Get.snackbar('Error', 'Invalid username/email or password');
        return;
      }

      // Set current user
      await prefs.setString(_currentUserKey, jsonEncode(user));

      currentUserEmail.value = user['email'];
      currentUserCategory.value = user['category'];
      isLoggedIn.value = true;

      _clearSignInForm();
      Get.snackbar('Success', 'Welcome back!');
      Get.offAll(() => HomePage());
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in');
    } finally {
      isLoading.value = false;
    }
  }

  // Sign out
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentUserKey);

    currentUserEmail.value = '';
    currentUserCategory.value = '';
    isLoggedIn.value = false;

    Get.snackbar('Success', 'Signed out successfully');
  }

  // Validation functions
  bool _validateSignUpForm(String category) {
    if (usernameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter username');
      return false;
    }
    if (emailController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter email address');
      return false;
    }
    if (!emailController.text.trim().contains('@')) {
      Get.snackbar('Error', 'Please enter a valid email address');
      return false;
    }
    if (category.isEmpty) {
      Get.snackbar('Error', 'Please select category');
      return false;
    }
    if (passwordController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter password');
      return false;
    }
    if (passwordController.text.trim().length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters');
      return false;
    }
    return true;
  }

  bool _validateSignInForm() {
    if (loginUsernameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter username or email');
      return false;
    }
    if (loginPasswordController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter password');
      return false;
    }
    return true;
  }

  // Clear forms
  void _clearSignUpForm() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void _clearSignInForm() {
    loginUsernameController.clear();
    loginPasswordController.clear();
  }

  // Debug method to check stored users
  Future<void> debugUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getStringList(_usersKey) ?? [];
    print('=== STORED USERS DEBUG ===');
    print('Total users: ${usersJson.length}');
    for (int i = 0; i < usersJson.length; i++) {
      try {
        final user = jsonDecode(usersJson[i]);
        print(
            'User $i: ${user['email']} / ${user['username']} / ${user['category']}');
      } catch (e) {
        print('Error parsing user $i: $e');
      }
    }
    print('=== END DEBUG ===');
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    loginUsernameController.dispose();
    loginPasswordController.dispose();
    super.onClose();
  }
}

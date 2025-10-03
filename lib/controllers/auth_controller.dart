import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:real_estate_app/supabase_config.dart';

class AuthController extends GetxController {
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
    _listenToAuthChanges();
  }

  // Check if user is already logged in via Supabase
  Future<void> checkLoginStatus() async {
    if (!isSupabaseConfigured) {
      isLoggedIn.value = false;
      currentUserEmail.value = '';
      currentUserCategory.value = '';
      return;
    }
    final supabase = Supabase.instance.client;
    final session = supabase.auth.currentSession;
    final user = supabase.auth.currentUser;

    if (session != null && user != null) {
      currentUserEmail.value = user.email ?? '';
      final metadata = user.userMetadata ?? {};
      currentUserCategory.value = (metadata['category'] as String?) ?? '';
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
      currentUserEmail.value = '';
      currentUserCategory.value = '';
    }
  }

  void _listenToAuthChanges() {
    if (!isSupabaseConfigured) return;
    final supabase = Supabase.instance.client;
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      final session = data.session;
      final user = session?.user;

      if (user != null) {
        currentUserEmail.value = user.email ?? '';
        final metadata = user.userMetadata ?? {};
        currentUserCategory.value = (metadata['category'] as String?) ?? '';
        isLoggedIn.value = true;
      } else {
        isLoggedIn.value = false;
        currentUserEmail.value = '';
        currentUserCategory.value = '';
      }
    });
  }

  // Sign up new user via Supabase
  Future<void> signUp(String category) async {
    if (!_validateSignUpForm(category)) return;

    try {
      if (!isSupabaseConfigured) {
        Get.snackbar('Configuration', 'Supabase is not configured');
        return;
      }
      isLoading.value = true;
      final supabase = Supabase.instance.client;
      final email = emailController.text.trim().toLowerCase();
      final password = passwordController.text.trim();
      final username = usernameController.text.trim();

      final res = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'username': username,
          'category': category,
        },
      );

      final session = res.session; // may be null if email confirmation required
      final user = res.user;

      if (user == null) {
        Get.snackbar('Verify Email', 'Check your email to confirm your account');
        return;
      }

      // If session exists, navigate to home
      if (session != null) {
        currentUserEmail.value = user.email ?? '';
        final metadata = user.userMetadata ?? {};
        currentUserCategory.value = (metadata['category'] as String?) ?? '';
        isLoggedIn.value = true;
        Get.snackbar('Success', 'Account created successfully!');
        Get.offAll(() => HomePage());
      } else {
        Get.snackbar('Verify Email', 'We sent you a confirmation link.');
      }

      _clearSignUpForm();
    } on AuthException catch (e) {
      Get.snackbar('Error', e.message);
    } catch (e) {
      Get.snackbar('Error', 'Failed to create account');
    } finally {
      isLoading.value = false;
    }
  }

  // Sign in existing user via Supabase (email + password)
  Future<void> signIn() async {
    if (!_validateSignInForm()) return;

    try {
      if (!isSupabaseConfigured) {
        Get.snackbar('Configuration', 'Supabase is not configured');
        return;
      }
      isLoading.value = true;
      final supabase = Supabase.instance.client;

      final email = loginUsernameController.text.trim().toLowerCase();
      final password = loginPasswordController.text.trim();

      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = res.user;
      if (user == null) {
        Get.snackbar('Error', 'Invalid email or password');
        return;
      }

      currentUserEmail.value = user.email ?? '';
      final metadata = user.userMetadata ?? {};
      currentUserCategory.value = (metadata['category'] as String?) ?? '';
      isLoggedIn.value = true;

      _clearSignInForm();
      Get.snackbar('Success', 'Welcome back!');
      Get.offAll(() => HomePage());
    } on AuthException catch (e) {
      Get.snackbar('Error', e.message);
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in');
    } finally {
      isLoading.value = false;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      if (!isSupabaseConfigured) {
        isLoggedIn.value = false;
        currentUserEmail.value = '';
        currentUserCategory.value = '';
        return;
      }
      final supabase = Supabase.instance.client;
      await supabase.auth.signOut();
    } catch (_) {}

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
      Get.snackbar('Error', 'Please enter email address');
      return false;
    }
    if (!loginUsernameController.text.trim().contains('@')) {
      Get.snackbar('Error', 'Please enter a valid email address');
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

  // Debug no longer needed with Supabase-backed auth

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

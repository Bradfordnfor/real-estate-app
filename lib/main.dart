import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/Housify%20pages/properties.dart';

import 'package:real_estate_app/Housify%20pages/review_page.dart';
import 'package:real_estate_app/Housify%20pages/saved_properties_page.dart';
import 'package:real_estate_app/add_home2.dart';
import 'package:real_estate_app/details_page.dart';
import 'package:real_estate_app/signup_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://gggikqthbfsblwiqhcsp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdnZ2lrcXRoYmZzYmx3aXFoY3NwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAwNDUyMTQsImV4cCI6MjA1NTYyMTIxNH0.DjpUsQKSHxPuQaYprdKFE9q5ZnHQh_OXZ3H1739jiQ0',
  );
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
        fontFamily: GoogleFonts.raleway().fontFamily,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Signup(),
    );
  }
}

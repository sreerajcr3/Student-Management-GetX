import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_app_final/screens/home_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily,textTheme: TextTheme(bodySmall: TextStyle(fontWeight: FontWeight.bold))),
      home: HomeScreen(),
    );
  }
}

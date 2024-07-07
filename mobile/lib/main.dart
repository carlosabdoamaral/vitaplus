import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitaplus/pages/home/home_page.dart';
import 'package:vitaplus/utils/colors.dart';

void main() {
  runApp(const VitaPlusApp());
}

class VitaPlusApp extends StatelessWidget {
  const VitaPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vita+',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        useMaterial3: true,
        textTheme: GoogleFonts.senTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

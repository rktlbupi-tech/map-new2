import 'package:flutter/material.dart';
import 'package:map/map/screens/dashboard_root.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.black, displayColor: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
        cardColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          surface: Colors.white,
        ), dialogTheme: DialogThemeData(backgroundColor: Colors.white),
      ),
      home: const DashboardRoot(),
    );
  }
}

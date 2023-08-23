import 'package:apple_ecommerce_animation/components/colors.dart';
import 'package:apple_ecommerce_animation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: primary,
        textTheme: GoogleFonts.poppinsTextTheme(myTextTheme()),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            shape: const StadiumBorder(),
            backgroundColor: primaryColor,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }

  TextTheme myTextTheme() {
    return const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 18,
      ),
      // bodySmall: TextStyle(
      //     fontWeight: FontWeight.bold,
      //     fontSize: 10),
    );
  }
}

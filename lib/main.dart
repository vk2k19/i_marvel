import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_icons/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MARVEL ICONS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: Brightness.light),
        textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: GoogleFonts.oswald(
                fontSize: 30,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
            bodyMedium: GoogleFonts.merriweather(),
            displaySmall: GoogleFonts.pacifico()),
        useMaterial3: true,
      ),
      home: const SpalshScreen(),
    );
  }
}

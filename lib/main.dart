import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_icons/app_routes.dart';
import 'package:marvel_icons/screens/home_screen.dart';
import 'package:marvel_icons/screens/character_detail_screen.dart';
import 'package:marvel_icons/screens/characters_screen.dart';
import 'package:marvel_icons/screens/splash_screen.dart';
import 'package:marvel_icons/states/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);

    if (kDebugMode) {
      print('Flutter Error: $details');
    }
    if (kReleaseMode) exit(1);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    if (kDebugMode) {
      print('PlatformDispatcher error: $error');
    }
    return true;
  };
  runApp(ChangeNotifierProvider(
    create: (context) => AppState()..fetchCharacters(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoutes route = AppRoutes();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: route.spalshScreen,
      routes: {
        route.spalshScreen: (context) => SpalshScreen(),
        route.homeScreen: (context) => HomeScreen(),
        route.charactersScreen: (context) => CharactersScreen(),
        route.characterDetailScreen: (context) => CharacterDetailScreen()
      },
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
    );
  }
}

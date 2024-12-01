import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_icons/app_routes.dart';

class SpalshScreen extends StatefulWidget {
  final routes = AppRoutes();
  SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(widget.routes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/light_icon.png',
                fit: BoxFit.cover,
                width: width * 0.75,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Text(
            'i.MARVEL',
            style: GoogleFonts.blackOpsOne(
                color: Colors.white, fontSize: width * 0.15),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          SpinKitThreeBounce(
            color: Colors.white,
            size: 64,
            duration: Duration(seconds: 3),
          )
        ],
      ),
    );
  }
}

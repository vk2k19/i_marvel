import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_icons/app_routes.dart';
import 'package:marvel_icons/components/custom_text.dart';
import 'package:marvel_icons/states/app_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final routes = AppRoutes();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
            child: CustomText(
          text: 'i.MARVEL ICONS',
          type: CustomTextType.heading,
        )),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height / 2),
          child: CarouselView(
              scrollDirection: Axis.horizontal,
              itemExtent: double.infinity,
              children: [
                Image.asset('assets/images/wp/1.jpg',
                    width: height * 0.9, fit: BoxFit.cover),
                Image.asset('assets/images/wp/2.jpg',
                    width: height * 0.9, fit: BoxFit.cover),
                Image.asset('assets/images/wp/3.jpg',
                    width: height * 0.9, fit: BoxFit.cover),
                Image.asset('assets/images/wp/4.jpg',
                    width: height * 0.9, fit: BoxFit.cover),
                Image.asset('assets/images/wp/5.jpg',
                    width: height * 0.9, fit: BoxFit.cover),
                Image.asset('assets/images/wp/6.jpg',
                    width: height * 0.9, fit: BoxFit.cover),
              ]),
        ),
        SizedBox(height: height * 0.04),
        Text('i.MARVEL',
            style: GoogleFonts.blackOpsOne(
                color: Colors.white, fontSize: width * 0.1)),
        Text('Welcomes! you.',
            style: GoogleFonts.mPlus1(
                color: Colors.white,
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold)),
        SizedBox(height: height * 0.04),
        ElevatedButton(
            onPressed: () {
              if (appState.searchText.isNotEmpty) {
                appState.setSearchText('');
                appState.refreshPage();
              }
              Navigator.pushNamed(context, routes.characters);
            },
            child: Text('See all Marvel Iconic Character'))
      ]),
    );
  }
}

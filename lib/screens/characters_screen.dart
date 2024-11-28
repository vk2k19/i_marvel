import 'package:flutter/material.dart';

class MarvelCharacters extends StatefulWidget {
  const MarvelCharacters({super.key});

  @override
  State<MarvelCharacters> createState() => _MarvelCharactersState();
}

class _MarvelCharactersState extends State<MarvelCharacters> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    // final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        SizedBox(height: height * 0.05),
        Text(
          'iMarvel Iconic Characters',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          textAlign: TextAlign.center,
        ),
        Divider(),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          margin: EdgeInsets.all(8.0),
          child: Image.asset('assets/images/wp/1.jpg'),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          margin: EdgeInsets.all(8.0),
          child: Image.asset('assets/images/wp/3.jpg'),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          margin: EdgeInsets.all(8.0),
          child: Image.asset('assets/images/wp/2.jpg'),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          margin: EdgeInsets.all(8.0),
          child: Image.asset('assets/images/wp/4.jpg'),
        )
      ],
    ));
  }
}

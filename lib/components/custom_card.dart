import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_icons/components/custom_text.dart';

class CustomCard extends StatelessWidget {
  final int id;
  final String title;
  final String? description;
  final String imageUrl;

  const CustomCard(
      {super.key,
      required this.id,
      required this.title,
      this.description,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;

    List<Widget> content = [
      CustomText(
        text: title,
        style: GoogleFonts.blackOpsOne(
          fontSize: width * 0.04,
          fontWeight: FontWeight.w200,
          color: Colors.black,
        ),
      ),
    ];

    if (description != null && description!.isNotEmpty) {
      content.add(Padding(
        padding: const EdgeInsets.only(right: 100),
        child: Divider(thickness: 2),
      ));
      content.add(CustomText(
        text: description!,
        maxLines: 3,
        color: Colors.black,
      ));
    }

    return Card(
        shadowColor: Colors.black,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl,
                    width: width * 0.3, height: width * 0.3, fit: BoxFit.fill),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: content),
                )),
          ],
        ));
  }
}

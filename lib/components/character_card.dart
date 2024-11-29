import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_icons/app_routes.dart';
import 'package:marvel_icons/components/custom_card.dart';
import 'package:marvel_icons/components/custom_text.dart';
import 'package:marvel_icons/models/character_model.dart';

class CharacterCard extends StatelessWidget {
  final routes = AppRoutes();
  final Character character;

  CharacterCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;

    List<Widget> content = [
      CustomText(
        text: character.name!,
        style: GoogleFonts.blackOpsOne(
          fontSize: width * 0.04,
          fontWeight: FontWeight.w200,
          color: Colors.black,
        ),
      ),
    ];

    if (character.description != null && character.description!.isNotEmpty) {
      content.add(Padding(
        padding: const EdgeInsets.only(right: 100),
        child: Divider(thickness: 2),
      ));
      content.add(CustomText(
        text: character.description!,
        maxLines: 3,
        color: Colors.black,
      ));
    }

    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            routes.characterDetail,
            arguments: character.id!,
          );
        },
        child: CustomCard(
          id: character.id!,
          title: character.name!,
          imageUrl:
              '${character.thumbnail?.path}.${character.thumbnail?.extension?.name}',
          description: character.description,
        ));
  }
}

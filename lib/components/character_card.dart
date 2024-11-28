import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_icons/components/custom_card.dart';
import 'package:marvel_icons/components/custom_text.dart';
import 'package:marvel_icons/models/character_model.dart';
import 'package:marvel_icons/screens/icon_detail_screen.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IconDetailScreen(
                character: character,
              ),
            ),
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

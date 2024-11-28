import 'package:flutter/material.dart';
import 'package:marvel_icons/components/character_info_list.dart';
import 'package:marvel_icons/components/custom_text.dart';
import 'package:marvel_icons/models/character_model.dart';

class IconDetailScreen extends StatelessWidget {
  final Character character;

  const IconDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    if (character.id == null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
      return SafeArea(
          child: Center(
              child:
                  CustomText(text: 'Missing information. Redirecting back.')));
    }
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: CustomText(
            text: character.name!, type: CustomTextType.heading, maxLines: 1),
      ),
      body: ListView(
        children: [
          Image.network(
              '${character.thumbnail!.path}.${character.thumbnail!.extension!.name}',
              fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: CustomText(
                  text: character.name!,
                  type: CustomTextType.heading,
                )),
                Center(
                    child: CustomText(
                  text: (character.description == null ||
                          character.description!.isEmpty)
                      ? " - "
                      : character.description!,
                )),
                SizedBox(height: 8),
                CharacterInfoList(
                  title: 'Comics',
                  activites:
                      character.comics!.items!.map((x) => x.name!).toList(),
                ),
                SizedBox(height: 8),
                Divider(),
                CharacterInfoList(
                  title: 'Stories',
                  activites: character.stories!.items!
                      .map((x) => '${x.type!.name}:${x.name}')
                      .toList(),
                ),
                SizedBox(height: 8),
                Divider(),
                CharacterInfoList(
                  title: 'Events',
                  activites:
                      character.events!.items!.map((x) => x.name!).toList(),
                ),
                SizedBox(height: 8),
                Divider(),
                CharacterInfoList(
                  title: 'Series',
                  activites:
                      character.series!.items!.map((x) => x.name!).toList(),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:marvel_icons/app_routes.dart';
import 'package:marvel_icons/components/character_info_list.dart';
import 'package:marvel_icons/components/custom_text.dart';
import 'package:marvel_icons/models/character_model.dart';
import 'package:marvel_icons/states/app_state.dart';
import 'package:provider/provider.dart';

class IconDetailScreen extends StatelessWidget {
  final routes = AppRoutes();

  IconDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as int;
    final data = Provider.of<AppState>(context);
    final Character character = data.getCharacterDetails(id);
    if (character.name == null || character.name!.isEmpty) {
      Navigator.pushNamed(context, routes.characters);
      return CustomText(text: 'Missing info redirecting to Icons list...');
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
                      .map((x) => '${x.type?.name ?? 'unknown'}:${x.name}')
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

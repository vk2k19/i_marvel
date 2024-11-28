import 'package:flutter/material.dart';
import 'package:marvel_icons/components/custom_text.dart';

class CharacterInfoList extends StatelessWidget {
  final String title;
  final List<String> activites;

  static const List<String> defaultInfo = ["None"];

  const CharacterInfoList(
      {super.key, required this.title, this.activites = defaultInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, type: CustomTextType.heading, size: 0.04),
        ...(activites.isNotEmpty ? activites : defaultInfo)
            .map((activity) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CustomText(text: activity),
                )),
      ],
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marvel_icons/components/character_card.dart';
import 'package:marvel_icons/components/custom_loading.dart';
import 'package:marvel_icons/components/custom_status.dart';
import 'package:marvel_icons/components/custom_text.dart';
import 'package:marvel_icons/states/app_state.dart';
import 'package:provider/provider.dart';

class IconsScreen extends StatelessWidget {
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppState>(context);
    final ScrollController scrollController = ScrollController();
    final itemsCount = data.charactes.length;

    print(' data here count ${data.totalItems}');

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: SizedBox(
            height: 32,
            child: TextField(
                onChanged: data.setSearchText,
                onSubmitted: (_) {
                  data.refreshPage();
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Search By Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
          ),
        ),
        body: RefreshIndicator(
            onRefresh: data.refreshPage,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemsCount + 1, // To allow loading
              itemBuilder: (context, index) {
                if (index < itemsCount) {
                  return CharacterCard(
                    character: data.charactes[index],
                  );
                } else if (data.isLoading) {
                  return Loader(text: 'Loading');
                } else if (data.hasError) {
                  return Column(
                    children: [
                      Status(
                          message: 'Something went wrong. Pulldown to refresh.',
                          type: MessageType.error),
                    ],
                  );
                } else if (data.hasMoreItems) {
                  return Loader(
                    text: 'Loading more',
                    size: 16,
                    type: LoaderType.dots,
                  );
                } else if (itemsCount == 0) {
                  return Status(message: 'No data.');
                } else {
                  return Center(child: CustomText(text: '--X-- END --X--'));
                }
              },
              controller: scrollController
                ..addListener(() {
                  if (data.isLoading || data.totalItems <= 20) {
                    return; // Adjust the threshold as needed
                  }

                  if (scrollController.position.pixels ==
                          scrollController.position.maxScrollExtent &&
                      data.hasMoreItems) {
                    data.fetchCharacters();
                  }
                } as VoidCallback),
            )));
  }
}

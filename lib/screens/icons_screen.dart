import 'package:flutter/material.dart';
import 'package:marvel_icons/components/character_card.dart';
import 'package:marvel_icons/components/custom_loading.dart';
import 'package:marvel_icons/components/custom_status.dart';
import 'package:marvel_icons/components/custom_text.dart';
import 'package:marvel_icons/models/character_model.dart';
import 'package:marvel_icons/utils/fetch_marvel_data.dart';

class IconsScreen extends StatefulWidget {
  const IconsScreen({super.key});

  @override
  _IconsScreenState createState() => _IconsScreenState();
}

class _IconsScreenState extends State<IconsScreen> {
  List<Character> items = [];
  bool isLoading = false;
  int offset = 0;
  int limit = 20;
  bool hasMoreItems = true;

  Future<void> fetchData(bool reload) async {
    try {
      setState(() {
        isLoading = true;
      });
      if ((items.isEmpty && hasMoreItems) || reload) {
        final response = await fetchMarvelData(
            'https://gateway.marvel.com:443/v1/public/characters?offset=$offset&limit=$limit');
        if (response.data != null) {
          final CharacterModel characters =
              CharacterModel().fromJson(response.data!);
          setState(() {
            items.addAll(characters.data?.results ?? []);
            offset = (characters.data?.offset ?? 0) + limit;
            hasMoreItems = (characters.data?.total ?? 0) >
                ((characters.data?.offset ?? 0) + limit);
          });
        } else {
          throw Exception('Failed to load data');
        }
      }
    } catch (error) {
      setState(() {
        hasMoreItems = false;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      offset = 0;
      items = [];
      hasMoreItems = true;
    });
    fetchData(true);
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return FutureBuilder(
      future: fetchData(false),
      builder: (context, snapshot) {
        Widget content = Status(message: 'No data.');
        final itemsCount = items.length;
        if (isLoading) {
          content = Loader(text: 'Loading');
        } else if (snapshot.hasError) {
          content =
              Status(message: 'Something went wrong. Pulldown to refresh.');
        } else if (itemsCount > 0) {
          content = RefreshIndicator(
            onRefresh: _refreshData,
            child: ListView.builder(
              itemCount: itemsCount + 1, // To allow loading
              itemBuilder: (context, index) {
                if (index < itemsCount) {
                  return CharacterCard(
                    character: items[index],
                  );
                } else {
                  if (hasMoreItems) {
                    return Loader(
                      text: 'Loading more',
                      size: 16,
                      type: LoaderType.dots,
                    );
                  } else {
                    return Center(child: CustomText(text: '- x End x -'));
                  }
                }
              },
              controller: scrollController
                ..addListener(() {
                  if (isLoading || items.length < 20) {
                    return; // Adjust the threshold as needed
                  }

                  if (scrollController.position.pixels ==
                          scrollController.position.maxScrollExtent &&
                      hasMoreItems) {
                    fetchData(true);
                  }
                } as VoidCallback),
            ),
          );
        }

        return SafeArea(
          child: Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                title: CustomText(
                  text: 'Marvel Icons',
                  type: CustomTextType.heading,
                ),
              ),
              body: content),
        );
      },
    );
  }
}

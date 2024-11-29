import 'package:flutter/foundation.dart';
import 'package:marvel_icons/models/character_model.dart';
import 'package:marvel_icons/models/marvel_response_model.dart';
import 'package:marvel_icons/services/marvel_service.dart';

class AppState extends ChangeNotifier {
  List<Character> _characters = [];
  bool _isLoading = false;
  int _offset = 0;
  int _limit = 20;
  bool _hasMoreItems = true;
  String _searchText = "";
  int _totalItems = 0;
  bool _hasError = false;

  get isLoading => _isLoading;
  get charactes => _characters;
  get offset => _offset;
  get limit => _limit;
  get hasMoreItems => _hasMoreItems;
  get searchText => _searchText;
  get totalItems => _totalItems;
  get hasError => _hasError;

  void _setStateResults(MarvelResponse response) {
    if (response.data != null) {
      CharacterModel data = CharacterModel().fromJson(response.data!);
      _characters = [..._characters, ...(data.data?.results ?? [])];
      _offset = data.data?.offset ?? 0;
      _limit = data.data?.limit ?? 20;
      _hasMoreItems = data.data?.total == null
          ? false
          : data.data!.total! >
              (data.data?.offset ?? 0) + (data.data?.limit ?? 20);
      _totalItems = data.data?.total != null ? data.data!.total! : 0;
      _hasError = false;
    } else {
      _hasError = true;
    }
    notifyListeners();
  }

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void setSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }

  Character getCharacterDetails(int id) {
    return _characters.firstWhere((character) => character.id == id,
        orElse: () => Character());
  }

  Future<void> refreshPage() async {
    _offset = 0;
    _limit = 20;
    _hasMoreItems = true;
    _characters = [];
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    setLoading(true);
    final nextOffset = _characters.isNotEmpty ? _offset + _limit : _offset;
    MarvelService.getCharacters(nextOffset, _limit, _searchText)
        .then((response) => _setStateResults(response))
        .catchError((error) {
      if (kDebugMode) {
        print('Error fetching characters: $error');
      }
    });
    setLoading(false);
  }
}

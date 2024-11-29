import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_icons/models/marvel_response_model.dart';

class MarvelService {
  static const String _apiKey = 'a8ed894ae7528121c52d125facbe53a6';
  static const String _privateKey = '63db45cbb2482af38f91a19c8d298415968bc67f';

  static Future<MarvelResponse> getCharacters(
      int offset, int limit, String searchText) async {
    try {
      final ts = DateTime.now().millisecondsSinceEpoch.toString();
      final hash =
          md5.convert(utf8.encode(ts + _privateKey + _apiKey)).toString();

      final url = Uri.https('gateway.marvel.com:443', '/v1/public/characters', {
        'ts': ts,
        'apikey': _apiKey,
        'hash': hash,
        'offset': offset.toString(),
        'limit': limit.toString(),
        ...(searchText.isNotEmpty ? {'nameStartsWith': searchText} : {}),
      });

      if (kDebugMode) {
        print('debug: url $url');
      }

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final String responseString = response.body;
        return MarvelResponse().fromJson({"data": jsonDecode(responseString)});
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      return MarvelResponse().fromJson({"error": error.toString()});
    }
  }
}

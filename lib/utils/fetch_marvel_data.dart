import 'dart:convert';

import 'package:marvel_icons/models/response_model.dart';
import 'package:marvel_icons/utils/generate_md5.dart';
import 'package:http/http.dart' as http;

Future<FetchResponse> fetchMarvelData(String url) async {
  try {
    String pvtKey = '<add-your-marvel-private-key>';
    String publicKey = '<Add-your-marvel-public-key>';
    String ts = DateTime.now().toString();
    final String hash = generateMd5('$ts$pvtKey$publicKey');

    final response =
        await http.get(Uri.parse('$url&ts=$ts&apikey=$publicKey&hash=$hash'));

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return FetchResponse().fromJson({"data": jsonDecode(responseString)});
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    return FetchResponse().fromJson({"error": error.toString()});
  }
}

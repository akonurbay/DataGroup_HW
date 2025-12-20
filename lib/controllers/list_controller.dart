import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lesson/data/character_model.dart';

class ListController {
  static Future<List<CharacterModel>> getCharacters() async {
    try {
      final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character'),
      );

      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> result = json['results'];

      return result
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('error network  ');
    }
  }
}

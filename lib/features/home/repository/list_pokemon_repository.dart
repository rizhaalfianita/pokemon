import 'dart:convert';

import 'package:pokemon/features/home/model/list_pokemon.dart';
import 'package:http/http.dart' as http;

class ListPokemonRepository {
  static Future<List<Pokemons>> fetchPokemons() async {
    try {
      var apiUrl =
          Uri.parse("https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20");
      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> responseBody = data['results'];
        print("RESPONSE BODY : ${responseBody}");
        final listPokemon = responseBody
            .map((json) => Pokemons.fromJson(json as Map<String, dynamic>))
            .toList();
        return listPokemon;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon/features/detail/model/pokemon.dart';


class PokemonRepository {
  static Future<Pokemon> fetchDetailPokemon(String url) async {
    try {
      var apiUrl = Uri.parse(url);
      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print("RESPONSE BODY : ${data}");
        return Pokemon.fromJson(data);  // Convert the JSON map to a Pokemon object
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

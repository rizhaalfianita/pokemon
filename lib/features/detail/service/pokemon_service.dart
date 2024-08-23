import 'package:pokemon/features/detail/model/pokemon.dart';
import 'package:pokemon/features/detail/repository/pokemon_repository.dart';
import 'package:pokemon/features/home/model/list_pokemon.dart';
import 'package:pokemon/features/home/repository/list_pokemon_repository.dart';

class PokemonService {
  static Future<List<Pokemons>> fetchPokemons() async {
    return await ListPokemonRepository.fetchPokemons();
  }
  static Future<Pokemon> fetchDetailPokemon(String url) async {
    return await PokemonRepository.fetchDetailPokemon(url);
  }
}

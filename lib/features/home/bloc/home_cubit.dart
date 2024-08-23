import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/detail/service/pokemon_service.dart';
import 'package:pokemon/features/home/model/list_pokemon.dart';
import 'package:pokemon/shared/model/state_controller.dart';

class HomeCubit extends Cubit<StateController<List<Pokemons>>> {
  HomeCubit() : super(StateController.idle());

  Future<void> fetchPokemons() async {
    emit(StateController.loading());
    try {
      final listPokemon = await PokemonService.fetchPokemons();
      emit(StateController.success(listPokemon));
    } catch (e) {
      emit(StateController.error(errorMessage: e.toString()));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/detail/model/pokemon.dart';
import 'package:pokemon/features/detail/service/pokemon_service.dart';
import 'package:pokemon/shared/model/state_controller.dart';

class DetailCubit extends Cubit<StateController<Pokemon>> {
  DetailCubit() : super(StateController.idle());

  Future<void> fetchDetailPokemon(String url) async {
    emit(StateController.loading());
    try {
      final detailPokemon = await PokemonService.fetchDetailPokemon(url);
      emit(StateController.success(detailPokemon));
    } catch (e) {
      emit(StateController.error(errorMessage: e.toString()));
    }
  }
}

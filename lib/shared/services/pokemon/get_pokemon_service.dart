import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/repositories/pokemon_repository.dart';
import 'package:pokedex/shared/services/alert/alert_service.dart';

class GetPokemonService {
  PokemonRepository pokemonRepository = Modular.get();
  Future<List<Pokemon>> listar(int offset, int limit) async {
    try {
      List<Pokemon> result = [];

      List<Pokemon> lista = await pokemonRepository.getListaPokemon(
        offset,
        limit,
      );

      for (Pokemon pokemon in lista) {
        pokemon = await pokemonRepository.getPokemon(pokemon.nome);
        result.add(pokemon);
      }

      return result;
    } catch (e) {
      print(e);

      AlertService.toast('Erro durante conexão com api');

      return [];
    }
  }
}

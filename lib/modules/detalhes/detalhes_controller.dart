import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/repositories/pokemon_repository.dart';
part 'detalhes_controller.g.dart';

class DetalhesController = DetalhesControllerBase with _$DetalhesController;

abstract class DetalhesControllerBase with Store {
  final PokemonRepository _pokemonRepository = Modular.get();
  @observable
  Pokemon pokemon;

  load(String slug) async {
    pokemon = null;
    pokemon = await _pokemonRepository.getPokemon(slug);
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/repositories/pokemon_repository.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  PokemonRepository pokemonRepository = Modular.get();

  @observable
  List<Pokemon> listaPokemon = [];

  @observable
  int offset = 0;

  int limit = 10;

  loadPokemon() async {
    listaPokemon = await pokemonRepository.getListaPokemon(offset, limit);
    offset += limit;
  }
}

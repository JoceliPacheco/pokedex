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

  @observable
  bool loading = false;

  int limit = 20;

  loadPokemon() async {
    List<Pokemon> _lista = listaPokemon;

    loading = true;
    await Future.delayed(Duration(seconds: 4));
    _lista.addAll(await pokemonRepository.getListaPokemon(offset, limit));
    offset += limit;

    listaPokemon = _lista;

    loading = false;

    print('listaPokemon => ${listaPokemon.length}');
  }

  goDetalhes(String slug) {
    Modular.to.pushNamed(
      '/detalhes',
      arguments: {
        'slug': slug,
      },
    );
  }
}

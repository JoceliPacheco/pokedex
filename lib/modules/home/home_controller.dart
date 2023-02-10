import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/services/pokemon/get_pokemon_service.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  GetPokemonService _getPokemon = Modular.get();

  @observable
  List<Pokemon> listaPokemon = [];

  @observable
  int offset = 0;

  @observable
  bool loading = false;

  @observable
  bool modeVIewList = false;

  @action
  void changeModeView() {
    modeVIewList = !modeVIewList;
  }

  int limit = 20;

  void loadPokemon() async {
    List<Pokemon> _lista = listaPokemon;

    loading = true;

    _lista.addAll(await _getPokemon.listar(offset, limit));
    listaPokemon = _lista;

    loading = false;
    offset += limit;

    print('Qtd => ${listaPokemon.length}');
  }

  void goDetalhes(String slug) {
    Modular.to.pushNamed(
      '/detalhes',
      arguments: {
        'slug': slug,
      },
    );
  }
}

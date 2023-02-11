import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/services/pokemon/get_pokemon_service.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  GetPokemonService _getPokemon = Modular.get();

  ScrollController scroll;

  double tolerancia = 50;

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

  initScroll() {
    scroll = ScrollController();
    scroll.addListener(handleScroll);
  }

  handleScroll() {
    if (scroll.position.pixels + tolerancia >=
            scroll.position.maxScrollExtent &&
        !loading) {
      loadPokemon();
    }
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

  void goDetalhes(Pokemon pokemon) {
    Modular.to.pushNamed(
      '/detalhes',
      arguments: {
        'pokemon': pokemon,
      },
    );
  }
}

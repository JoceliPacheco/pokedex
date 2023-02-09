import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/home/home_controller.dart';
import 'package:pokedex/shared/components/pokemon/card_list_pokemon.dart';
import 'package:pokedex/shared/components/pokemon/simple_content/simple_content_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Modular.get();

  ScrollController _scrollController;

  double tolerancia = 50;

  @override
  void initState() {
    super.initState();
    _controller.loadPokemon();
    _scrollController = ScrollController();
    _scrollController.addListener(handleScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  handleScroll() {
    if (_scrollController.position.pixels + tolerancia >=
            _scrollController.position.maxScrollExtent &&
        !_controller.loading) {
      _controller.loadPokemon();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => SimpleContentContainer(
              expand: true,
              child: ListView(
                controller: _scrollController,
                children: _controller.listaPokemon
                    .map((pokemon) => CardListPokemon(
                          pokemon,
                          onTap: () => _controller.goDetalhes(
                            pokemon.nome,
                          ),
                        ))
                    .toList(),
              ),
              bottom: _controller.loading ? CircularProgressIndicator() : null,
            )
        /*  , */
        );
  }
}

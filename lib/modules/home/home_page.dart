import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/home/home_controller.dart';
import 'package:pokedex/shared/components/pokemon/card_grid_pokemon.dart';
import 'package:pokedex/shared/components/pokemon/card_list_pokemon.dart';
import 'package:pokedex/shared/components/simple_content/simple_content_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _controller.changeModeView(),
            icon: Observer(
              builder: (context) => Icon(
                !_controller.modeVIewList ? Icons.list : Icons.grid_3x3,
              ),
            ),
          )
        ],
      ),
      body: Observer(
          builder: (context) => SimpleContentContainer(
                expand: true,
                child: _controller.modeVIewList ? modoList : modoGrid,
                bottom:
                    _controller.loading ? CircularProgressIndicator() : null,
              )
          /*  , */
          ),
    );
  }

  Widget get modoGrid => StaggeredGridView.countBuilder(
        controller: _scrollController,
        padding: EdgeInsets.only(bottom: 40),
        crossAxisCount: 4,
        itemCount: _controller.listaPokemon.length,
        itemBuilder: (BuildContext context, int index) => CardGridPokemon(
          _controller.listaPokemon[index],
          onTap: () => _controller.goDetalhes(
            _controller.listaPokemon[index],
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      );

  Widget get modoList => ListView(
        padding: EdgeInsets.only(bottom: 40),
        controller: _scrollController,
        children: _controller.listaPokemon
            .map((pokemon) => CardListPokemon(
                  pokemon,
                  onTap: () => _controller.goDetalhes(pokemon),
                ))
            .toList(),
      );
}

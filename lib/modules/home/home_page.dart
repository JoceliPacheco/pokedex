import 'package:flutter/cupertino.dart';
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

  double tolerancia = 50;

  @override
  void initState() {
    super.initState();
    _controller.loadPokemon();
    _controller.initScroll();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.scroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () => _controller.changeModeView(),
            icon: Observer(
              builder: (context) => Icon(
                !_controller.modeVIewList ? Icons.list : Icons.grid_4x4_sharp,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          return SimpleContentContainer(
            expand: true,
            child: _builBody,
            bottom: _controller.loading
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  )
                : null,
          );
        },
      ),
    );
  }

  Widget get _builBody {
    if (!_controller.loading && _controller.listaPokemon.isEmpty) {
      return _emptyList;
    }

    return _controller.modeVIewList ? modoList : modoGrid;
  }

  Widget get modoGrid => StaggeredGridView.countBuilder(
        controller: _controller.scroll,
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
        controller: _controller.scroll,
        padding: EdgeInsets.only(bottom: 40),
        children: _controller.listaPokemon
            .map((pokemon) => CardListPokemon(
                  pokemon,
                  onTap: () => _controller.goDetalhes(pokemon),
                ))
            .toList(),
      );

  Widget get _emptyList => Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off,
              size: 48,
            ),
            Text(
              'Sem resultados',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            TextButton(
              onPressed: () => _controller.loadPokemon(),
              child: Text('Tentar novamente'),
            )
          ],
        ),
      );
}

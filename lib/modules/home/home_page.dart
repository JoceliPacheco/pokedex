import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Modular.get();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    homeController.loadPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ListView(
        children: homeController.listaPokemon
            .map((pokemon) => Text(pokemon.nome))
            .toList(),
      ),
    );
  }
}

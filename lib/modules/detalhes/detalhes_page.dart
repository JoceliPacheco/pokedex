import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/helpers/tranformers.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/modules/detalhes/detalhes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/shared/constants/type_collor.dart';
import 'package:pokedex/shared/models/pokemon.dart';

class DetalhePage extends StatefulWidget {
  final Pokemon pokemon;
  DetalhePage({this.pokemon, Key key}) : super(key: key);

  @override
  _DetalhePageState createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  final DetalhesController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    //controller.load(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: darken(
          hexToColor(
            corTipo[widget.pokemon.tipos.first.nome] ?? '#cccccc',
          ),
        ),
        child: Icon(Icons.close),
        onPressed: () {
          Modular.to.pop();
        },
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  color: hexToColor(
                    corTipo[widget.pokemon.tipos.first.nome] ?? '#cccccc',
                  ),
                ),
                child: Column(
                  children: [
                    SvgPicture.network(
                      getPhoto(widget.pokemon.id),
                    ),
                    Card(
                      elevation: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.pokemon.nome.toUpperCase(),
                              style: TextStyle(
                                color: darken(
                                  hexToColor(
                                    corTipo[widget.pokemon.tipos.first.nome] ??
                                        '#cccccc',
                                  ),
                                ),
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          Text('Habilidade(s)'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.pokemon.habilidades
                .map((e) => Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.nome),
                    )))
                .toList(),
          ),
          Divider(),
          Text('Tipo(s)'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.pokemon.tipos
                .map((e) => Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.nome),
                    )))
                .toList(),
          ),
        ],
      ),
    );
  }
}

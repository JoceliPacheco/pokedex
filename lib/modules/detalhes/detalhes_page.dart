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
      appBar: AppBar(
        backgroundColor: widget.pokemon == null
            ? null
            : hexToColor(
                corTipo[widget.pokemon.tipos.first.nome] ?? '#cccccc',
              ),
      ),
      body: Observer(
        builder: (context) {
          return Column(
            children: [
              Center(
                child: SvgPicture.network(getPhoto(widget.pokemon.id)),
              ),
              Row(
                children: widget.pokemon.habilidades
                    .map((e) => Text(' (' + e.nome + ') '))
                    .toList(),
              ),
              Row(
                children: widget.pokemon.tipos
                    .map((e) => Text(' (' + e.nome + ') '))
                    .toList(),
              )
            ],
          );
        },
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/modules/detalhes/detalhes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetalhePage extends StatefulWidget {
  final String slug;
  DetalhePage({this.slug, Key key}) : super(key: key);

  @override
  _DetalhePageState createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  final DetalhesController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.load(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (context) {
          if (controller.pokemon == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              ListTile(
                leading: CachedNetworkImage(
                  imageUrl: getPathPhoto(controller.pokemon.id),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                title: Text(controller.pokemon.nome),
              ),
              Row(
                children: controller.pokemon.habilidades
                    .map((e) => Text(' (' + e.nome + ') '))
                    .toList(),
              ),
              Row(
                children: controller.pokemon.tipos
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

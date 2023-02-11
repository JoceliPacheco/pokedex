import 'package:flutter/material.dart';
import 'package:pokedex/helpers/collor.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/modules/detalhes/detalhes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/shared/components/images/foto_pokemon.dart';
import 'package:pokedex/shared/components/label/nome_pokemon.dart';
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
            corByTipo[widget.pokemon.tipos.first.nome] ?? '#cccccc',
          ),
        ),
        child: Icon(Icons.close),
        onPressed: () {
          Modular.to.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 100,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    color: hexToColor(
                      corByTipo[widget.pokemon.tipos.first.nome] ?? '#cccccc',
                    ),
                  ),
                  child: Column(
                    children: [
                      Hero(
                        tag: widget.pokemon.id,
                        child: FotoPokemon(widget.pokemon),
                      ),
                      Card(
                        elevation: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NomePokemon(
                                widget.pokemon,
                                fontSize: 32,
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
            Container(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

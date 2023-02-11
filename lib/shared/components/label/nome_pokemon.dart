import 'package:flutter/material.dart';
import 'package:pokedex/helpers/collor.dart';
import 'package:pokedex/shared/constants/type_collor.dart';
import 'package:pokedex/shared/models/pokemon.dart';

class NomePokemon extends StatelessWidget {
  final Pokemon pokemon;
  final double fontSize;
  NomePokemon(
    this.pokemon, {
    this.fontSize: 18,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      pokemon.nome.toUpperCase(),
      style: TextStyle(
        color: darken(
          hexToColor(
            corByTipo[pokemon.tipos.first.nome] ?? '#cccccc',
          ),
        ),
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}

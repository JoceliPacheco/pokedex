import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/shared/models/pokemon.dart';

class FotoPokemon extends StatelessWidget {
  final Pokemon pokemon;
  const FotoPokemon(this.pokemon, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      getPhoto(pokemon.id),
    );
  }
}

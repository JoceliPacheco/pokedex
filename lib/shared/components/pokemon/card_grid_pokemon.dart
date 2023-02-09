import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/shared/models/pokemon.dart';

class CardGridPokemon extends StatelessWidget {
  final Pokemon pokemon;
  final Function onTap;
  CardGridPokemon(
    this.pokemon, {
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Text(pokemon.nome),
        trailing: Text(pokemon.tipos.first.nome),
        title: Center(
          child: CachedNetworkImage(
            imageUrl: getPathPhoto(pokemon.id),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

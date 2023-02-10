import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/shared/models/pokemon.dart';

class CardListPokemon extends StatelessWidget {
  final Pokemon pokemon;
  final Function onTap;
  CardListPokemon(
    this.pokemon, {
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(pokemon.nome),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(pokemon.tipos.first.nome),
        ),
        title: Center(
          child: CachedNetworkImage(
            imageUrl: getThumb(pokemon.id),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

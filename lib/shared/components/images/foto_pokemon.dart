import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/shared/models/pokemon.dart';

class FotoPokemon extends StatelessWidget {
  final Pokemon pokemon;
  final bool svg;
  const FotoPokemon(
    this.pokemon, {
    Key key,
    this.svg: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.svg) {
      return SvgPicture.network(
        getPhoto(pokemon.id),
        width: 300,
        height: 300,
      );
    }

    return CachedNetworkImage(
      imageUrl: getThumb(pokemon.id),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

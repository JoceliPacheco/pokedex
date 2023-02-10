import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/helpers/tranformers.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/shared/constants/type_collor.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //set border radius more than 50% of height and width to make circle
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: hexToColor(
                      corTipo[pokemon.tipos.first.nome] ?? '#cccccc',
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: getThumb(pokemon.id),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Center(
                child: Text(
                  pokemon.nome.toUpperCase(),
                  style: TextStyle(
                      color: darken(
                        hexToColor(
                          corTipo[pokemon.tipos.first.nome] ?? '#cccccc',
                        ),
                      ),
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

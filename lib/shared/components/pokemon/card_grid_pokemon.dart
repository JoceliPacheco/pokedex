import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/helpers/collor.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/shared/components/label/nome_pokemon.dart';
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
    double size = MediaQuery.of(context).size.width / 4;
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
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: hexToColor(
                      corByTipo[pokemon.tipos.first.nome] ?? '#cccccc',
                    ),
                  ),
                  child: Hero(
                    tag: pokemon.id,
                    child: SvgPicture.network(
                      getPhoto(pokemon.id),
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),
              Center(
                child: NomePokemon(pokemon),
              )
            ],
          ),
        ),
      ),
    );
  }
}

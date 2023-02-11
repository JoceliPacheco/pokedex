import 'package:flutter/material.dart';
import 'package:pokedex/shared/components/images/foto_pokemon.dart';
import 'package:pokedex/shared/components/label/nome_pokemon.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: ListTile(
          title: NomePokemon(
            pokemon,
            fontSize: 14,
          ),
          subtitle: Text(
            pokemon.tipos.first.nome,
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Hero(
            tag: pokemon.id,
            child: FotoPokemon(pokemon),
          ),
        ),
      ),
    );
  }
}

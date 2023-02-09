import 'package:pokedex/shared/models/api_url_method.dart';

abstract class ApiUrl {
  static ApiUrlMethod getListaPokemon() => ApiUrlMethod(
        baseUrl: 'https://pokeapi.co/api/v2/',
        path: 'pokemon',
        httpMethod: 'GET',
      );

  static ApiUrlMethod getPokemon(String slug) => ApiUrlMethod(
        baseUrl: 'https://pokeapi.co/api/v2/',
        path: 'pokemon/$slug',
        httpMethod: 'GET',
      );
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/config/api_url.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/services/http/api_request.dart';

class PokemonRepository {
  final ApiRequest _api = Modular.get();

  Future<List<Pokemon>> getListaPokemon(int offset, int limit) async {
    return await _api.request(
      ApiUrl.getListaPokemon(),
      query: {
        'limit': limit,
        'offset': offset,
      },
    ).then((data) => Pokemon.fromList(data['results']));
  }
}

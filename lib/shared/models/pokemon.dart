import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/helpers/tranformers.dart';
import 'package:pokedex/shared/models/habilidade.dart';
import 'package:pokedex/shared/models/tipo.dart';

part 'pokemon.g.dart';

@JsonSerializable(createToJson: true, ignoreUnannotated: true)
class Pokemon {
  @JsonKey(name: 'name')
  String nome;

  @JsonKey(name: 'id', fromJson: dynamicToString)
  String id;

  @JsonKey(name: 'abilities')
  List<Habilidade> habilidades;

  @JsonKey(name: 'types')
  List<Tipo> tipos;

  Pokemon({
    this.nome,
    this.id,

    //
    this.habilidades: const [],
    this.tipos: const [],
  });

  static List<Pokemon> fromList(List<dynamic> list) {
    return list.map((_) => Pokemon.fromJson(_)).toList();
  }

  factory Pokemon.fromJson(Map<String, dynamic> map) => _$PokemonFromJson(map);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable(createToJson: true, ignoreUnannotated: true)
class Pokemon {
  @JsonKey(name: 'name')
  String nome;

  Pokemon({
    this.nome,
  });

  static List<Pokemon> fromList(List<dynamic> list) {
    return list.map((_) => Pokemon.fromJson(_)).toList();
  }

  factory Pokemon.fromJson(Map<String, dynamic> map) => _$PokemonFromJson(map);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    nome: json['name'] as String,
    id: dynamicToString(json['id']),
    habilidades: (json['abilities'] as List)
        ?.map((e) =>
            e == null ? null : Habilidade.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tipos: (json['types'] as List)
        ?.map(
            (e) => e == null ? null : Tipo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.nome,
      'id': instance.id,
      'abilities': instance.habilidades,
      'types': instance.tipos,
    };

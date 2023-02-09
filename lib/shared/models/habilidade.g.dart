// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habilidade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Habilidade _$HabilidadeFromJson(Map<String, dynamic> json) {
  return Habilidade(
    nome: Habilidade.parseHabilidade(json['ability'] as Map),
  );
}

Map<String, dynamic> _$HabilidadeToJson(Habilidade instance) =>
    <String, dynamic>{
      'ability': instance.nome,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tipo _$TipoFromJson(Map<String, dynamic> json) {
  return Tipo(
    nome: Tipo.parseTipo(json['type'] as Map),
  );
}

Map<String, dynamic> _$TipoToJson(Tipo instance) => <String, dynamic>{
      'type': instance.nome,
    };

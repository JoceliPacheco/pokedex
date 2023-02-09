import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/helpers/tranformers.dart';

part 'tipo.g.dart';

@JsonSerializable(createToJson: true, ignoreUnannotated: true)
class Tipo {
  @JsonKey(name: 'type', fromJson: parseTipo)
  String nome;

  Tipo({
    this.nome,
  });

  static List<Tipo> fromList(List<dynamic> list) {
    return list.map((_) => Tipo.fromJson(_)).toList();
  }

  factory Tipo.fromJson(Map<String, dynamic> map) => _$TipoFromJson(map);

  Map<String, dynamic> toJson() => _$TipoToJson(this);

  static String parseTipo(Map map) {
    return map['name'];
  }
}

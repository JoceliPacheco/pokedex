import 'package:json_annotation/json_annotation.dart';

part 'habilidade.g.dart';

@JsonSerializable(createToJson: true, ignoreUnannotated: true)
class Habilidade {
  @JsonKey(name: 'ability', fromJson: parseHabilidade)
  String nome;

  Habilidade({
    this.nome,
  });

  static List<Habilidade> fromList(List<dynamic> list) {
    return list.map((_) => Habilidade.fromJson(_)).toList();
  }

  factory Habilidade.fromJson(Map<String, dynamic> map) =>
      _$HabilidadeFromJson(map);

  Map<String, dynamic> toJson() => _$HabilidadeToJson(this);

  static String parseHabilidade(Map map) {
    return map['name'];
  }
}

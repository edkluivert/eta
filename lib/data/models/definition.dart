import 'package:json_annotation/json_annotation.dart';

part 'definition.g.dart';

@JsonSerializable()
class Definition {
  final String source;
  final String text;
  final String partOfSpeech;

  Definition({required this.source, required this.text, required this.partOfSpeech});


  factory Definition.fromJson(Map<String, dynamic> json) => _$DefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionToJson(this);

}
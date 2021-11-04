import 'package:json_annotation/json_annotation.dart';

import 'definition.dart';

part 'word.g.dart';

@JsonSerializable()
class  Word{

final String word;
final List<Definition> definitions;

Word({required this.word, required this.definitions});

factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

Map<String, dynamic> toJson() => _$WordToJson(this);
}
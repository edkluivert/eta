

class Word {
  Word({
      String? id, 
      String? word, 
      ContentProvider? contentProvider, 
      List<Definitions>? definitions, 
      String? publishDate, 
      List<Examples>? examples, 
      String? pdd, 
      dynamic htmlExtra, 
      String? note,}){
    _id = id;
    _word = word;
    _contentProvider = contentProvider;
    _definitions = definitions;
    _publishDate = publishDate;
    _examples = examples;
    _pdd = pdd;
    _htmlExtra = htmlExtra;
    _note = note;
}

  Word.fromJson(dynamic json) {
    _id = json['_id'];
    _word = json['word'];
    _contentProvider = json['contentProvider'] != null ? ContentProvider.fromJson(json['contentProvider']) : null;
    if (json['definitions'] != null) {
      _definitions = [];
      json['definitions'].forEach((v) {
        _definitions?.add(Definitions.fromJson(v));
      });
    }
    _publishDate = json['publishDate'];
    if (json['examples'] != null) {
      _examples = [];
      json['examples'].forEach((v) {
        _examples?.add(Examples.fromJson(v));
      });
    }
    _pdd = json['pdd'];
    _htmlExtra = json['htmlExtra'];
    _note = json['note'];
  }
  String? _id;
  String? _word;
  ContentProvider? _contentProvider;
  List<Definitions>? _definitions;
  String? _publishDate;
  List<Examples>? _examples;
  String? _pdd;
  dynamic _htmlExtra;
  String? _note;

  String? get id => _id;
  String? get word => _word;
  ContentProvider? get contentProvider => _contentProvider;
  List<Definitions>? get definitions => _definitions;
  String? get publishDate => _publishDate;
  List<Examples>? get examples => _examples;
  String? get pdd => _pdd;
  dynamic get htmlExtra => _htmlExtra;
  String? get note => _note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['word'] = _word;
    if (_contentProvider != null) {
      map['contentProvider'] = _contentProvider?.toJson();
    }
    if (_definitions != null) {
      map['definitions'] = _definitions?.map((v) => v.toJson()).toList();
    }
    map['publishDate'] = _publishDate;
    if (_examples != null) {
      map['examples'] = _examples?.map((v) => v.toJson()).toList();
    }
    map['pdd'] = _pdd;
    map['htmlExtra'] = _htmlExtra;
    map['note'] = _note;
    return map;
  }

}



class Examples {
  Examples({
      String? url, 
      String? title, 
      String? text, 
      int? id,}){
    _url = url;
    _title = title;
    _text = text;
    _id = id;
}

  Examples.fromJson(dynamic json) {
    _url = json['url'];
    _title = json['title'];
    _text = json['text'];
    _id = json['id'];
  }
  String? _url;
  String? _title;
  String? _text;
  int? _id;

  String? get url => _url;
  String? get title => _title;
  String? get text => _text;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['title'] = _title;
    map['text'] = _text;
    map['id'] = _id;
    return map;
  }

}



class Definitions {
  Definitions({
      String? source, 
      String? text, 
      dynamic note, 
      String? partOfSpeech,}){
    _source = source;
    _text = text;
    _note = note;
    _partOfSpeech = partOfSpeech;
}

  Definitions.fromJson(dynamic json) {
    _source = json['source'];
    _text = json['text'];
    _note = json['note'];
    _partOfSpeech = json['partOfSpeech'];
  }
  String? _source;
  String? _text;
  dynamic _note;
  String? _partOfSpeech;

  String? get source => _source;
  String? get text => _text;
  dynamic get note => _note;
  String? get partOfSpeech => _partOfSpeech;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['source'] = _source;
    map['text'] = _text;
    map['note'] = _note;
    map['partOfSpeech'] = _partOfSpeech;
    return map;
  }

}


class ContentProvider {
  ContentProvider({
      String? name, 
      int? id,}){
    _name = name;
    _id = id;
}

  ContentProvider.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
  }
  String? _name;
  int? _id;

  String? get name => _name;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    return map;
  }

}
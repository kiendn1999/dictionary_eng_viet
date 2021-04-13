class WordModel {
  int word_id;
  String word;
  String pronounce;
  String meaning;

  WordModel({this.word_id, this.word, this.pronounce, this.meaning});

  // To Json
  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map["word_id"] = word_id;
    map["word"] = word;
    map["pronounce"] = pronounce;
    map["meaning"] = meaning;
    return map;
  }

  // From Json
  factory WordModel.fromJson(json) {
    return WordModel(
        word_id: json['word_id'],
        word: json['word'],
        pronounce: json['pronounce'],
        meaning: json['meaning']);
  }
}

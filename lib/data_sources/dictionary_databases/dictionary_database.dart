import 'dart:io';
import 'package:dictionary_eng_viet/resources/utils/logs.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'word_model.dart';

class DictionaryDatabase {
  final String DB_NAME = "en_vi_dict.db";
  final String TABLE = "en_vi_dict";
  final String WORD_ID = "word_id";
  final String WORD = "word";
  final String PRONOUNCE = "pronounce";
  final String MEANING = "meaning";

  static final DictionaryDatabase _instance = DictionaryDatabase._();
  static Database _database;

  DictionaryDatabase._();

  factory DictionaryDatabase() {
    return _instance;
  }

  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await init();
    return _database;
  }

  // Database from Asset

  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME);
// Check if the database exists
    var exists = await databaseExists(path);
    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      // Copy from asset
      ByteData data = await rootBundle.load(join("assets/databases", DB_NAME));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
    var db = await openDatabase(path, readOnly: true);
    return db;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $TABLE(
        $WORD_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $WORD TEXT,
        $PRONOUNCE TEXT,
        $MEANING TEXT)       
    ''');
    print("Mark Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }

  Future<int> addWord(WordModel word) async {
    var client = await db;
    return client.insert(TABLE, word.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<WordModel> fetchWord(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
    client.query(TABLE, where: '$WORD_ID = ?', whereArgs: [id]);

    var maps = await futureMaps;
    if (maps.length != 0) {
      return WordModel.fromJson(maps.first);
    }
    return null;
  }

  Future<WordModel> fetchWordByWord(String word) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
    client.query(TABLE, where: '$WORD = ?', whereArgs: [word]);

    var maps = await futureMaps;
    if (maps.length != 0) {
      return WordModel.fromJson(maps.first);
    }
    return null;
  }

  Future<List<WordModel>> fetchAll() async {
    var client = await db;
    var res = await client.query(TABLE);

    if (res.isNotEmpty) {
      var words = res.map((wordMap) => WordModel.fromJson(wordMap)).toList();
      return words;
    }
    return [];
  }

  Future<List<WordModel>> searchEnglishResults(String searchWord) async {
    var client = await db;
    var response = await client.query(TABLE,
        where: '$WORD like ?', whereArgs: ['$searchWord%%'], limit: 14);
    List<WordModel> list = response.map((c) => WordModel.fromJson(c)).toList();

    return list;
  }

  Future<int> updateWord(WordModel newWord) async {
    var client = await db;
    return client.update(TABLE, newWord.toJson(),
        where: '$WORD_ID = ?',
        whereArgs: [newWord.word_id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeWord(int id) async {
    var client = await db;
    return client.delete(TABLE, where: '$WORD_ID = ?', whereArgs: [id]);
  }

  Future closeDb() async {
    var client = await db;
    client.close();
  }

  deleteAll() async {
    List<WordModel> list = await fetchAll();
    for (int i = 0; i < list.length; i++) {
      await removeWord(list[i].word_id);
    }
  }
}
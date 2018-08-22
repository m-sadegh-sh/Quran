import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataContext {
  static Database _database;

  Future<Database> get getDatabase async {
    if (_database != null) return _database;

    _database = await initDb();

    return _database;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "quran.db");

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database database, int version) async {
    await database.execute(
      "CREATE TABLE Chapters (Id INTEGER PRIMARY KEY, Title TEXT, Order INT, PartNumber INT, VersesCount INT, Classification INT)"
    );
  }
}

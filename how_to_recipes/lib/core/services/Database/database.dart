import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class DatabaseH {
  Future<Database> get database;
}

class DatabaseHImpl extends DatabaseH {
  Database _database;

  @override
  // TODO: implement database
  Future<Database> get database async {
    print('called');
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'Tasks.db';
    var database = await openDatabase(path, version: 1, onCreate: _createDb);
    return database;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE step(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, categoryId INTEGER, stepNum INTEGER)");
    await db
        .execute("CREATE TABLE category(id INTEGER PRIMARY KEY, title TEXT, description TEXT, image TEXT, createdAt TEXT)");
    print('db created');
  }
}

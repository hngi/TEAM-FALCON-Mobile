
import 'dart:io';

import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class DataBaseProvider{
    Future<Database> get database;
}


class DataBaseImpl extends DataBaseProvider{
  Database _database;
  @override
  // TODO: implement database
  Future<Database> get database async {
     if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Recipes.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Task ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "description TEXT,"
          "image TEXT,"
          "created_at TEXT"
          ")");
      await db.execute("CREATE TABLE Step ("
          "id INTEGER PRIMARY KEY,"
          "description TEXT,"
          "taskId INTEGER,"
          ")");
    });
  }

}
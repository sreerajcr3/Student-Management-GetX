import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _privatedb;

  Future<Database> get db async {
    if (_privatedb != null) {
      return _privatedb!;
    }
    _privatedb = await initDatabase();
    return _privatedb!;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'student.db');
    var db = openDatabase(path, version: 1, onCreate: _oncreate);
    return db;
  }

  _oncreate(Database db, int version) {
    db.execute(
        "CREATE TABLE student(id INTEGER PRIMARY KEY,name TEXT,domain TEXT,batch TEXT,image TEXT)");
  }
}

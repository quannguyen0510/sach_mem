import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableUnit = 'unitTable';
  final String columnId = 'id';
  final String columnUnit = 'unit';
  final String columnTitle = 'title';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'unit.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableUnit($columnId INTEGER PRIMARY KEY, $columnUnit TEXT, $columnTitle TEXT)');

    await db.rawInsert('INSERT INTO $tableUnit ($columnId, $columnUnit, $columnTitle) VALUES(1, "Unit 1", "In the park")');
    await db.rawInsert('INSERT INTO $tableUnit ($columnId, $columnUnit, $columnTitle) VALUES(2, "Unit 2", "In the dining room")');
  }

  Future<List> getAllUnits() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery('SELECT * FROM $tableUnit');
    return result.toList();
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}

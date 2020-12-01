import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phone_authentication/utility/database/model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DatabaseHelper {
  static final _databasename = 'rooms.db';
  static final _dataversion = 1;
  static Database _database;
  static final table = 'roomTable';
  static final rid = 'rid';
  static final rname = 'rname';
  static final description = 'rdesc';
  static final rtime = 'time';
  static final rlimit = 'rlimit';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get getDB async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dDirectory = await getApplicationDocumentsDirectory();
    String path = join(dDirectory.path, _databasename);
    return await openDatabase(path, version: _dataversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
         $rid INTEGER PRIMARY KEY,
         $rname TEXT NOT NULL,
         $rlimit INTEGER NOT NULL
      );
      ''');
  }

  //insert function
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.getDB;
    return await db.insert(table, row);
  }

  //query all rows
  Future<List<Map<String, dynamic>>> queryall() async {
    Database db = await instance.getDB;
    return await db.query(table);
  }

  Future<int> deletedata(int rid) async {
    Database db = await instance.getDB;
    var res = db.delete(table, where: "rid = ?", whereArgs: [rid]);
    return res;
  }
}

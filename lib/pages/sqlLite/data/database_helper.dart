import 'package:hello_world/pages/sqlLite/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DataBaseHelper {
  static final DataBaseHelper _instance = new DataBaseHelper.internal();

  factory DataBaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  DataBaseHelper.internal();

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    print("databasesPath: " + databasesPath);

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    print("database created");

    await db.execute(
        "CREATE TABLE User(id INTERGER PRIMARY KEY, username TEXT, password TEXT)");

    print("table  User is created");
  }

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    print("Insert into user $res");
    return res;
  }

  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }
}

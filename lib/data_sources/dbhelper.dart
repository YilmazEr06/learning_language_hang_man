import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Dbhelper {
  Database? _db;
   String  username="";
  String tablename = "UserInfo";
  
  bool get dbstatus{
    if (_db != null) {
      return true;
    }else{
      return true;
    }
  }
  
  Future<Database> get db async {
    return _db!;
  }
  
   Future<Database>  createdb_(String username) async {
    username=username;
     _db = await inilizedb();
    return _db!;
  }


  Future<String> get fullpath async {
    const name = "userinfo.db";
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> inilizedb() async {
    final path = await fullpath;

    var xdb = openDatabase(path,
        onCreate: createdb, version: 1, singleInstance: true);
    return xdb;
  }

  Future<void> createdb(Database db, int version) async {
    await db.execute("""
create table $tablename(
  "username" TEXT DEFAULT "?",
  "skor" INTEGER NOT NULL DEFAULT 0,
  "created_at" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now') as int )),
  "updated_at" INTEGER,
  "firstopen" bool DEFAULT false ,
  PRIMARY KEY("id" AUTOINCREMENT))
    """,[username]);
  }
}

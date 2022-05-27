import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo/src/data/data_sources/local/tables/todos_table.dart';

class DBProvider {
  static const String dbName = 'TodoTestDB.db';
  static const int dbVersion = 1;

  DBProvider();
  Future<Database> initDB() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    final path = join(databasesPath, dbName);
    // Open Database
    return await openDatabase(path, version: dbVersion, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await createTables(db);
    }, onUpgrade: (Database db, int oldVer, int newVer) async {
      await deleteTables(db);
      await createTables(db);
    });
  }

  // Run Create Tables Script
  Future createTables(Database db) async {
    await db.execute(TodosTable.create());
  }

  // Run Drop Tables Script
  Future deleteTables(Database db) async {
    await db.execute(TodosTable.drop());
  }
}

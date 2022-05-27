import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo/src/data/data_sources/local/tables/todos_table.dart';

class DBProviderTest {
  static const String dbName = 'TodoTestDB.db';
  static const int dbVersion = 1;

  DBProviderTest();
  Future<Database> initDB() async {
    sqfliteFfiInit();
    var factory = databaseFactoryFfi;
    // Open Database
    return await factory.openDatabase(inMemoryDatabasePath,
        options: OpenDatabaseOptions(
            version: dbVersion,
            onOpen: (db) {},
            onCreate: (Database db, int version) async {
              await createTables(db);
            },
            onUpgrade: (Database db, int oldVer, int newVer) async {
              await deleteTables(db);
              await createTables(db);
            }));
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

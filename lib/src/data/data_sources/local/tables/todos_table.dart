class TodosTable {
  static const String tableName = 'todos';

  static String create() {
    return ""
        "CREATE TABLE $tableName("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "title TEXT)";
  }

  static String drop() {
    return "DROP TABLE IF EXIST $tableName";
  }
}

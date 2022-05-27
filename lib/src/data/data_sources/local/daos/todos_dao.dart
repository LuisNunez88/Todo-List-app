import 'package:sqflite/sqflite.dart';

import 'package:todo/src/data/data_sources/local/tables/todos_table.dart';
import 'package:todo/src/domain/entities/todo.dart';

class TodosDao {
  final Database db;

  const TodosDao(this.db);

  final String _todosTable = TodosTable.tableName;

  Future<List<Todo>> getAll() async {
    try {
      // Get All Data from Database
      final data = await db.query(_todosTable);
      // Mapping the data
      final tdos = todosFromJson(data);
      return tdos;
    } catch (e) {
      return [];
    }
  }

  Future<Todo> createTodo(Todo todo) async {
    try {
      // Get All Data from Database
      final id = await db.insert(_todosTable, todo.toJson());
      // Set the id at inserted Todo
      final _nTodo = todo.copyWith(id: id);
      return _nTodo;
    } catch (e) {
      return null;
    }
  }

  Future<int> removeTodo(int id) async {
    try {
      //Remove the item from Database and return id
      return await db.delete(_todosTable, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      return null;
    }
  }
}
